import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/logic/calculator_logic.dart';
import 'package:bmi_calculator/logic/calculator_model.dart';
import 'package:bmi_calculator/logic/bmi.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc({@required this.calculatorLogic})
      : super(CalculatorInitialState());
  final CalculatorLogic calculatorLogic;
  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is EnterHeight) {
      yield* mapEnterHeight(event);
    }
    if (event is EnterWeight) {
      yield* mapEnterWeight(event);
    }
    if (event is ChangeUnit) {
      yield* mapChangeUnit(event);
    }
  }

  Stream<CalculatorState> mapEnterHeight(
    EnterHeight event,
  ) async* {
    CalculatorModel newCalculatorModel;
    double _parsedValue = double.parse(event.height);
    bool _isValid = calculatorLogic.validateHeight(
        height: event.height, selectedUnits: state.calculatorModel.unit);

    if (_isValid == true &&
        state.calculatorModel.weightError == false &&
        state.calculatorModel.height != 0.0 &&
        state.calculatorModel.weight != 0.0) {
      BMIResult bmiResult = calculatorLogic.calculateResult(
          height: _parsedValue,
          weight: state.calculatorModel.weight,
          unit: state.calculatorModel.unit);

      newCalculatorModel = state.calculatorModel.copyWith(
          height: _parsedValue, heightError: !_isValid, result: bmiResult);
    } else {
      newCalculatorModel = state.calculatorModel
          .copyWith(height: _parsedValue, heightError: !_isValid);
    }
    yield CalculationInputChanged(calculatorModel: newCalculatorModel);
  }

  Stream<CalculatorState> mapEnterWeight(
    EnterWeight event,
  ) async* {
    CalculatorModel newCalculatorModel;
    double _parsedValue = double.parse(event.weight);
    bool _isValid = calculatorLogic.validateWeight(
        weight: event.weight, selectedUnits: state.calculatorModel.unit);

    if (_isValid == true &&
        state.calculatorModel.heightError == false &&
        state.calculatorModel.height != 0.0 &&
        state.calculatorModel.weight != 0.0) {
      BMIResult bmiResult = calculatorLogic.calculateResult(
          height: state.calculatorModel.height,
          weight: _parsedValue,
          unit: state.calculatorModel.unit);
      newCalculatorModel = state.calculatorModel.copyWith(
          weight: _parsedValue, weightError: !_isValid, result: bmiResult);
    } else {
      newCalculatorModel = state.calculatorModel
          .copyWith(weight: _parsedValue, weightError: !_isValid);
    }
    yield CalculationInputChanged(calculatorModel: newCalculatorModel);
  }

  Stream<CalculatorState> mapChangeUnit(
    ChangeUnit event,
  ) async* {
    double _convertedHeight = calculatorLogic.convertHeightUnits(
        height: state.calculatorModel.height,
        previousUnits: state.calculatorModel.unit,
        selectedUnits: event.selectedUnits);

    double _convertedWeight = calculatorLogic.convertWeightUnits(
        weight: state.calculatorModel.weight,
        previousUnits: state.calculatorModel.unit,
        selectedUnits: event.selectedUnits);

    CalculatorModel newCalculatorModel = state.calculatorModel.copyWith(
        height: _convertedHeight,
        weight: _convertedWeight,
        unit: event.selectedUnits);

    yield CalculationInputChanged(calculatorModel: newCalculatorModel);
  }
}

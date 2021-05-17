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
  CalculatorLogic _calculatorLogic = new CalculatorLogic();
  CalculatorBloc() : super(CalculatorInitialState());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is EnterHeight) {
      CalculatorModel newCalculatorModel;
      double _parsedValue = double.parse(event.height);
      bool _isValid = _calculatorLogic.validateHeight(
          height: event.height, selectedUnits: state.calculatorModel.unit);

      if (_isValid == true &&
          state.calculatorModel.weightError == false &&
          state.calculatorModel.height != 0.0 &&
          state.calculatorModel.weight != 0.0) {
        BMIResult bmiResult = _calculatorLogic.calculateResult(
            height: _parsedValue,
            weight: state.calculatorModel.weight,
            unit: state.calculatorModel.unit);

        newCalculatorModel = state.calculatorModel.copyWith(
            height: _parsedValue, heightError: !_isValid, result: bmiResult);
      } else {
        newCalculatorModel = state.calculatorModel
            .copyWith(height: _parsedValue, heightError: !_isValid);
      }

      yield ValueChanged(calculatorModel: newCalculatorModel);
    }
    if (event is EnterWeight) {
      CalculatorModel newCalculatorModel;
      double _parsedValue = double.parse(event.weight);
      bool _isValid = _calculatorLogic.validateWeight(
          weight: event.weight, selectedUnits: state.calculatorModel.unit);

      if (state.calculatorModel.heightError == false &&
          _isValid == true &&
          state.calculatorModel.height != 0.0 &&
          state.calculatorModel.weight != 0.0) {
        BMIResult bmiResult = _calculatorLogic.calculateResult(
            height: state.calculatorModel.height,
            weight: _parsedValue,
            unit: state.calculatorModel.unit);
        newCalculatorModel = state.calculatorModel.copyWith(
            weight: _parsedValue, weightError: !_isValid, result: bmiResult);
      } else {
        newCalculatorModel = state.calculatorModel
            .copyWith(weight: _parsedValue, weightError: !_isValid);
      }
      yield ValueChanged(calculatorModel: newCalculatorModel);
    }
    if (event is ChangeUnit) {
      double _convertedHeight = _calculatorLogic.convertHeightUnits(
          height: state.calculatorModel.height,
          previousUnits: state.calculatorModel.unit,
          selectedUnits: event.selectedUnits);

      double _convertedWeight = _calculatorLogic.convertWeightUnits(
          weight: state.calculatorModel.weight,
          previousUnits: state.calculatorModel.unit,
          selectedUnits: event.selectedUnits);

      CalculatorModel newCalculatorModel = state.calculatorModel.copyWith(
          height: _convertedHeight,
          weight: _convertedWeight,
          unit: event.selectedUnits);

      yield ValueChanged(calculatorModel: newCalculatorModel);
    }
  }
}

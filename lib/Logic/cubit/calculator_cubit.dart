import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/Logic/BMI.dart';
import 'package:bmi_calculator/Logic/CalculatorLogic.dart';
import 'package:bmi_calculator/constants.dart';

import 'package:flutter/material.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorLogic _calculatorLogic = new CalculatorLogic();

  CalculatorCubit()
      : super(CalculatorState(
            height: 0.0,
            weight: 0.0,
            unit: Units.Metrical,
            heightError: false,
            weightError: false));

  void enterHeight({String height}) {
    double _parsedValue = double.parse(height);
    emit(state.copyWith(height: _parsedValue));
  }

  void enterWeight({String weight}) {
    double _parsedValue = double.parse(weight);
    emit(state.copyWith(weight: _parsedValue));
  }

  void changeUnit(Units newUnit) {
    final double convertedHeight = _calculatorLogic.convertHeightUnits(
        height: state.height,
        previuosUnits: state.unit,
        selectedUnits: newUnit);

    final double convertedWeight = _calculatorLogic.convertWeightUnits(
        weight: state.weight,
        previuosUnits: state.unit,
        selectedUnits: newUnit);

    emit(
      state.copyWith(
          height: convertedHeight, weight: convertedWeight, unit: newUnit),
    );
  }

  void validateHeight() {
    bool _isValid = _calculatorLogic.validateHeight(
        height: state.height.toString(), selectedUnits: state.unit);
    emit(state.copyWith(heightError: !_isValid));
  }

  void validateWeight() {
    bool _isValid = _calculatorLogic.validateWeight(
        weight: state.weight.toString(), selectedUnits: state.unit);
    emit(state.copyWith(weightError: !_isValid));
  }

  void calculateResult() {
    BMIResult bmiResult = _calculatorLogic.calculateResult(
        height: state.height, weight: state.weight, unit: state.unit);
    emit(
      state.copyWith(
        result: bmiResult,
      ),
    );
  }
}

import 'dart:math';

import 'package:bmi_calculator/Classes/BMI.dart';
import 'package:flutter/cupertino.dart';

class CalculatorLogic {
  double _bmiValue = 0.0;
  BMIResult _bmiResult = BMIResult();

  List<BMI> _listOfBMIs = [
    BMI(
      minValue: 0.0,
      maxValue: 18.5,
      description: 'Underweight',
      color: Color(0xFF7AB1FF),
    ),
    BMI(
      minValue: 18.5,
      maxValue: 24.9,
      description: 'Healthy weight',
      color: Color(0xFF117243),
    ),
    BMI(
      minValue: 24.9,
      maxValue: 29.9,
      description: 'Overweight',
      color: Color(0xFFFF595E),
    ),
    BMI(
      minValue: 29.9,
      maxValue: 34.9,
      description: 'Class 1 Obesity',
      color: Color(0xFFFF0000),
    ),
    BMI(
      minValue: 34.9,
      maxValue: 39.9,
      description: 'Class 2 Obesity',
      color: Color(0xFF922D25),
    ),
    BMI(
      minValue: 39.9,
      maxValue: double.maxFinite,
      description: 'Class 3 Obesity',
      color: Color(0xFF460000),
    )
  ];

  String convertHeightUnits({String height, bool toImperialUnits}) {
    double _convertedHeight = 0.0;

    if (double.tryParse(height) != null) {
      if (toImperialUnits) {
        _convertedHeight = double.parse(height) / 30.48;
      } else {
        _convertedHeight = double.parse(height) * 30.48;
      }
    }

    return _convertedHeight.toStringAsFixed(1);
  }

  String convertWeightUnits({String weight, bool toImperialUnits}) {
    double _convertedWeight = 0.0;

    if (double.tryParse(weight) != null) {
      if (toImperialUnits) {
        _convertedWeight = double.parse(weight) / 0.45359237;
      } else {
        _convertedWeight = double.parse(weight) * 0.45359237;
      }
    }

    return _convertedWeight.toStringAsFixed(1);
  }

  bool validateHeight({String height, bool imperialUnits}) {
    if (double.tryParse(height) != null) {
      double _heightValue = double.parse(height);
      if (imperialUnits) {
        if (_heightValue < 3 || _heightValue > 7) {
          return false;
        }
      } else {
        if (_heightValue < 100 || _heightValue > 220) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  bool validateWeight({String weight, bool imperialUnits}) {
    if (double.tryParse(weight) != null) {
      double _weightValue = double.parse(weight);
      if (imperialUnits) {
        if (_weightValue < 44 || _weightValue > 661) {
          return false;
        }
      } else {
        if (_weightValue < 20 || _weightValue > 300) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  void calculateResult({String height, String weight, bool imperialUnits}) {
    double _heightValue = double.parse(height);
    double _weightValue = double.parse(weight);

    if (imperialUnits) {
      _heightValue = _heightValue * 12.0;
      _bmiValue = 703.0 * _weightValue / pow(_heightValue, 2);
    } else {
      _bmiValue = _weightValue / pow(_heightValue / 100, 2);
    }

    for (BMI bmi in _listOfBMIs) {
      if (_bmiValue > bmi.minValue && _bmiValue <= bmi.maxValue) {
        _bmiResult = BMIResult(
            result: _bmiValue, description: bmi.description, color: bmi.color);
      }
    }
  }

  BMIResult getBMIResult() => _bmiResult;
}

import 'dart:math';

import 'package:bmi_calculator/Logic/BMI.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';

class CalculatorLogic {
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

  double toMetricalHeight({double height, Units units}) {
    double _metricalHeight = height;

    if (units == Units.Imperial) {
      _metricalHeight = height * 30.48;
    }
    if (units == Units.OldPolish) {
      _metricalHeight = height * 59.55;
    }

    return roundDouble(_metricalHeight, 1);
  }

  double convertHeightUnits(
      {double height, Units previuosUnits, Units selectedUnits}) {
    double _convertedHeight = 0.0;

    double _metricalHeight =
        toMetricalHeight(height: height, units: previuosUnits);

    switch (selectedUnits) {
      case Units.Metrical:
        _convertedHeight = _metricalHeight;
        break;

      case Units.Imperial:
        _convertedHeight = _metricalHeight / 30.48;
        break;

      case Units.OldPolish:
        _convertedHeight = _metricalHeight / 59.55;
        break;
    }

    return roundDouble(_convertedHeight, 1);
  }

  double toMetricalWeight({double weight, Units units}) {
    double _metricalWeight = weight;

    if (units == Units.Imperial) {
      _metricalWeight = weight * 0.4535;
    }
    if (units == Units.OldPolish) {
      _metricalWeight = weight * 0.4052;
    }

    return roundDouble(_metricalWeight, 1);
  }

  double convertWeightUnits(
      {double weight, Units previuosUnits, Units selectedUnits}) {
    double _convertedWeight = 0.0;

    double _metricalWeight =
        toMetricalWeight(weight: weight, units: previuosUnits);

    switch (selectedUnits) {
      case Units.Metrical:
        _convertedWeight = _metricalWeight;
        break;

      case Units.Imperial:
        _convertedWeight = _metricalWeight / 0.4535;
        break;

      case Units.OldPolish:
        _convertedWeight = _metricalWeight / 0.4052;
        break;
    }

    return roundDouble(_convertedWeight, 1);
  }

  bool validateHeight({String height, Units selectedUnits}) {
    if (double.tryParse(height) != null) {
      double _heightValue = double.parse(height);

      switch (selectedUnits) {
        case Units.Metrical:
          if (_heightValue < 100 || _heightValue > 220) {
            return false;
          }
          break;
        case Units.Imperial:
          if (_heightValue < 3 || _heightValue > 7) {
            return false;
          }
          break;
        case Units.OldPolish:
          if (_heightValue < 1.7 || _heightValue > 3.7) {
            return false;
          }
          break;
      }
      return true;
    }
    return false;
  }

  bool validateWeight({String weight, Units selectedUnits}) {
    if (double.tryParse(weight) != null) {
      double _weightValue = double.parse(weight);
      switch (selectedUnits) {
        case Units.Metrical:
          if (_weightValue < 20 || _weightValue > 300) {
            return false;
          }
          break;
        case Units.Imperial:
          if (_weightValue < 44 || _weightValue > 661) {
            return false;
          }
          break;
        case Units.OldPolish:
          if (_weightValue < 50 || _weightValue > 740) {
            return false;
          }
          break;
      }
      return true;
    }
    return false;
  }

  BMIResult calculateResult({double height, double weight, Units unit}) {
    BMIResult _bmiResult;
    double _bmiValue;

    double _metricalHeight = height;
    double _metricalWeight = weight;

    if (unit != Units.Metrical) {
      _metricalHeight = toMetricalHeight(height: height, units: unit);
      _metricalWeight = toMetricalWeight(weight: weight, units: unit);
    }

    _bmiValue = _metricalWeight / pow(_metricalHeight / 100, 2);

    for (BMI bmi in _listOfBMIs) {
      if (_bmiValue > bmi.minValue && _bmiValue <= bmi.maxValue) {
        _bmiResult = BMIResult(
            result: _bmiValue, description: bmi.description, color: bmi.color);
      }
    }

    return _bmiResult;
  }

  double roundDouble(double value, int places) {
    double mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}

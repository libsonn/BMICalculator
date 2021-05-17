import 'dart:math';

import 'package:bmi_calculator/logic/bmi.dart';
import 'package:bmi_calculator/constants.dart';

class CalculatorLogic {
  double toMetricalHeight({double height, Units units}) {
    double _metricalHeight = height;

    if (units == Units.Imperial) {
      _metricalHeight = height * 30.48;
    }
    if (units == Units.OldPolish) {
      _metricalHeight = height * 59.55;
    }

    return _metricalHeight;
  }

  double convertHeightUnits(
      {double height, Units previousUnits, Units selectedUnits}) {
    double _convertedHeight = 0.0;

    double _metricalHeight =
        toMetricalHeight(height: height, units: previousUnits);

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

    return _convertedHeight;
  }

  double toMetricalWeight({double weight, Units units}) {
    double _metricalWeight = weight;

    if (units == Units.Imperial) {
      _metricalWeight = weight * 0.4535;
    }
    if (units == Units.OldPolish) {
      _metricalWeight = weight * 0.4052;
    }

    return _metricalWeight;
  }

  double convertWeightUnits(
      {double weight, Units previousUnits, Units selectedUnits}) {
    double _convertedWeight = 0.0;

    double _metricalWeight =
        toMetricalWeight(weight: weight, units: previousUnits);

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

    return _convertedWeight;
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
          if (_heightValue <
                  convertHeightUnits(
                      height: 100,
                      previousUnits: Units.Metrical,
                      selectedUnits: Units.Imperial) ||
              _heightValue >
                  convertHeightUnits(
                      height: 220,
                      previousUnits: Units.Metrical,
                      selectedUnits: Units.Imperial)) {
            return false;
          }
          break;
        case Units.OldPolish:
          if (_heightValue <
                  convertHeightUnits(
                      height: 100,
                      previousUnits: Units.Metrical,
                      selectedUnits: Units.OldPolish) ||
              _heightValue >
                  convertHeightUnits(
                      height: 220,
                      previousUnits: Units.Metrical,
                      selectedUnits: Units.OldPolish)) {
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
    for (var bmi in listOfBMIs) {
      if (_bmiValue > bmi.minValue && _bmiValue <= bmi.maxValue) {
        _bmiResult = BMIResult(
            value: _bmiValue, description: bmi.description, color: bmi.color);
      }
    }

    return _bmiResult;
  }
}

import 'package:bmi_calculator/logic/bmi.dart';
import 'package:bmi_calculator/logic/calculator_logic.dart';
import 'package:flutter/material.dart';

const Color deepAquaColor = Color(0xFF003B46);
const Color oceanColor = Color(0xFF07575B);
const Color waveColor = Color(0xFF66A5AD);
const Color seafoamColor = Color(0xFFC4DFE6);

enum Units { Metrical, Imperial, OldPolish }

CalculatorLogic _calculatorLogic = CalculatorLogic();

Map<Units, Map<String, String>> boundHeightValues = {
  Units.Metrical: {
    'maxHeight': '220 cm',
    'minHeight': '100 cm',
  },
  Units.Imperial: {
    'maxHeight': _calculatorLogic
            .convertHeightUnits(
                height: 220,
                previousUnits: Units.Metrical,
                selectedUnits: Units.Imperial)
            .toStringAsFixed(1) +
        ' feet',
    'minHeight': _calculatorLogic
            .convertHeightUnits(
                height: 100,
                previousUnits: Units.Metrical,
                selectedUnits: Units.Imperial)
            .toStringAsFixed(1) +
        ' feet',
  },
  Units.OldPolish: {
    'maxHeight': _calculatorLogic
            .convertHeightUnits(
                height: 220,
                previousUnits: Units.Metrical,
                selectedUnits: Units.OldPolish)
            .toStringAsFixed(1) +
        ' Ł',
    'minHeight': _calculatorLogic
            .convertHeightUnits(
                height: 100,
                previousUnits: Units.Metrical,
                selectedUnits: Units.OldPolish)
            .toStringAsFixed(1) +
        ' Ł',
  }
};
Map<Units, Map<String, String>> boundWeightValues = {
  Units.Metrical: {
    'maxWeight': '300 kg',
    'minWeight': '20 kg',
  },
  Units.Imperial: {
    'maxWeight': _calculatorLogic
            .convertWeightUnits(
                weight: 300,
                previousUnits: Units.Metrical,
                selectedUnits: Units.Imperial)
            .toStringAsFixed(1) +
        ' lb',
    'minWeight': _calculatorLogic
            .convertWeightUnits(
                weight: 20,
                previousUnits: Units.Metrical,
                selectedUnits: Units.Imperial)
            .toStringAsFixed(1) +
        ' lb',
  },
  Units.OldPolish: {
    'maxWeight': _calculatorLogic
            .convertWeightUnits(
                weight: 300,
                previousUnits: Units.Metrical,
                selectedUnits: Units.OldPolish)
            .toStringAsFixed(1) +
        ' F',
    'minWeight': _calculatorLogic
            .convertWeightUnits(
                weight: 20,
                previousUnits: Units.Metrical,
                selectedUnits: Units.OldPolish)
            .toStringAsFixed(1) +
        ' F',
  }
};

List<BMI> listOfBMIs = [
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
    color: Color(0xFFB32C2C),
  ),
  BMI(
    minValue: 39.9,
    maxValue: double.maxFinite,
    description: 'Class 3 Obesity',
    color: Color(0xFF922D25),
  )
];

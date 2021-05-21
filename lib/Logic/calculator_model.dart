import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/logic/bmi.dart';
import 'package:flutter/material.dart';

class CalculatorModel {
  final double height;
  final double weight;
  final Units unit;
  final bool heightError;
  final bool weightError;
  final BMIResult result;

  CalculatorModel({
    @required this.height,
    @required this.weight,
    @required this.unit,
    @required this.heightError,
    @required this.weightError,
    @required this.result,
  });

  CalculatorModel copyWith(
      {double height,
      double weight,
      Units unit,
      bool heightError,
      bool weightError,
      BMIResult result}) {
    return CalculatorModel(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      unit: unit ?? this.unit,
      heightError: heightError ?? this.heightError,
      weightError: weightError ?? this.weightError,
      result: result ?? this.result,
    );
  }
}

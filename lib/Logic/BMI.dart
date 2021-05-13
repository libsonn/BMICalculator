import 'package:flutter/material.dart';

class BMI {
  BMI({this.maxValue, this.minValue, this.description, this.color});

  final double maxValue;
  final double minValue;
  final String description;
  final Color color;
}

class BMIResult extends BMI {
  BMIResult({this.result, description, color})
      : super(description: description, color: color);
  double result = 0.0;
}

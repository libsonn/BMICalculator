import 'package:flutter/material.dart';

class BMI {
  BMI({this.maxValue, this.minValue, this.description, this.color});

  double maxValue = 0.0;
  double minValue = 0.0;
  String description = '';
  Color color = Colors.black;
}

class BMIResult extends BMI {
  BMIResult({this.result, description, color})
      : super(description: description, color: color);
  double result = 0.0;
}

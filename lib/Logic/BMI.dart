import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BMI extends Equatable {
  BMI({this.maxValue, this.minValue, this.description, this.color});

  final double maxValue;
  final double minValue;
  final String description;
  final Color color;

  @override
  List<Object> get props => [maxValue, minValue, description, color];
}

class BMIResult extends BMI {
  BMIResult({this.value, description, color})
      : super(description: description, color: color);
  final double value;
}

part of 'calculator_cubit.dart';

class CalculatorState {
  double height;
  double weight;
  Units unit;
  bool heightError;
  bool weightError;
  BMI result;

  CalculatorState({
    @required this.height,
    @required this.weight,
    @required this.unit,
    @required this.heightError,
    @required this.weightError,
    this.result,
  });

  CalculatorState copyWith(
      {double height,
      double weight,
      Units unit,
      bool heightError,
      bool weightError,
      BMIResult result}) {
    return CalculatorState(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      unit: unit ?? this.unit,
      heightError: heightError ?? this.heightError,
      weightError: weightError ?? this.weightError,
      result: result ?? this.result,
    );
  }
}

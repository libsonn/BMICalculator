part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  final CalculatorModel calculatorModel;
  CalculatorState({this.calculatorModel});
}

class CalculatorInitialState extends CalculatorState {
  CalculatorInitialState()
      : super(
          calculatorModel: CalculatorModel(
            height: 0,
            weight: 0,
            unit: Units.Metrical,
            heightError: false,
            weightError: false,
            result:
                new BMIResult(value: 0.0, description: '', color: Colors.red),
          ),
        );

  @override
  List<Object> get props => [calculatorModel];
}

class CalculationInputChanged extends CalculatorState {
  final CalculatorModel calculatorModel;

  CalculationInputChanged({@required this.calculatorModel})
      : super(calculatorModel: calculatorModel);

  @override
  List<Object> get props => [calculatorModel];
}

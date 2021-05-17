part of 'calculator_bloc.dart';

abstract class CalculatorState extends Equatable {
  final CalculatorModel calculatorModel;

  CalculatorState({@required this.calculatorModel});
}

class CalculatorInitialState extends CalculatorState {
  CalculatorInitialState() : super(calculatorModel: CalculatorModel());

  @override
  List<Object> get props => [calculatorModel];
}

class ValueChanged extends CalculatorState {
  final CalculatorModel calculatorModel;

  ValueChanged({@required this.calculatorModel})
      : super(calculatorModel: calculatorModel);

  @override
  List<Object> get props => [calculatorModel];
}

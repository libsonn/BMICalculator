part of 'calculator_bloc.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class EnterHeight extends CalculatorEvent {
  final String height;
  EnterHeight({@required this.height});
}

class EnterWeight extends CalculatorEvent {
  final String weight;
  EnterWeight({@required this.weight});
}

class ChangeUnit extends CalculatorEvent {
  final Units selectedUnits;
  ChangeUnit({@required this.selectedUnits});
}

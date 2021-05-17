import 'package:bmi_calculator/logic/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class UnitSelectCheckboxes extends StatelessWidget {
  UnitSelectCheckboxes({
    @required this.screenWidth,
    @required this.heightController,
    @required this.weightController,
  });

  final double screenWidth;
  final TextEditingController heightController;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 220,
        width: screenWidth / 1.5,
        child: BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return ListView(
              children: [
                CheckboxListTile(
                  activeColor: waveColor,
                  value: state.calculatorModel.unit == Units.Metrical,
                  onChanged: (value) {
                    BlocProvider.of<CalculatorBloc>(context)
                        .add(ChangeUnit(selectedUnits: Units.Metrical));

                    heightController.text =
                        state.calculatorModel.height.toStringAsFixed(2);
                    weightController.text =
                        state.calculatorModel.weight.toStringAsFixed(2);
                  },
                  title: Text('Metrical Units'),
                ),
                CheckboxListTile(
                  activeColor: waveColor,
                  value: state.calculatorModel.unit == Units.Imperial,
                  onChanged: (value) {
                    BlocProvider.of<CalculatorBloc>(context)
                        .add(ChangeUnit(selectedUnits: Units.Imperial));

                    heightController.text =
                        state.calculatorModel.height.toStringAsFixed(2);
                    weightController.text =
                        state.calculatorModel.weight.toStringAsFixed(2);
                  },
                  title: Text('Imperial Units'),
                ),
                CheckboxListTile(
                  activeColor: waveColor,
                  value: state.calculatorModel.unit == Units.OldPolish,
                  onChanged: (value) {
                    BlocProvider.of<CalculatorBloc>(context)
                        .add(ChangeUnit(selectedUnits: Units.OldPolish));

                    heightController.text =
                        state.calculatorModel.height.toStringAsFixed(2);
                    weightController.text =
                        state.calculatorModel.weight.toStringAsFixed(2);
                  },
                  title: Text('Old polish Units'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

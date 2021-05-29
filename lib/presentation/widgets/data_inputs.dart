import 'package:bmi_calculator/Presentation/widgets/custom_numeric_text_field.dart';
import 'package:bmi_calculator/logic/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class DataInputs extends StatelessWidget {
  final double screenHeight;
  final TextEditingController heightController;
  final TextEditingController weightController;

  DataInputs(
      {@required this.heightController,
      @required this.weightController,
      @required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    String _enteredHeight = '';
    String _enteredWeight = '';

    String _heightError = 'Value is incorrect!';
    String _weightError = 'Value is incorrect!';

    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state is CalculatorInitialState) {
          return Column(
            children: [
              SizedBox(
                height: screenHeight / 15,
              ),
              CustomNumericTextField(
                textEditingController: heightController,
                onChanged: (value) {
                  if (double.tryParse(value) != null) {
                    _enteredHeight = value.toString().replaceAll(',', '.');
                    BlocProvider.of<CalculatorBloc>(context)
                        .add(EnterHeight(height: _enteredHeight));
                  }
                },
                hint: 'Enter your height',
                textFieldDescription: 'Height',
                textFieldBounds: boundHeightValues[Units.Metrical]
                        ['minHeight'] +
                    ' - ' +
                    boundHeightValues[Units.Metrical]['maxHeight'],
              ),
              SizedBox(height: 2.0),
              Center(
                child: Text(
                  '',
                  style: TextStyle(color: Colors.red, fontSize: 10.0),
                ),
              ),
              SizedBox(
                height: screenHeight / 20,
              ),
              CustomNumericTextField(
                textEditingController: weightController,
                onChanged: (value) {
                  if (double.tryParse(value) != null) {
                    _enteredWeight = value.toString().replaceAll(',', '.');
                    BlocProvider.of<CalculatorBloc>(context)
                        .add(EnterWeight(weight: _enteredWeight));
                  }
                },
                hint: 'Enter your weight',
                textFieldDescription: 'Weight',
                textFieldBounds: boundWeightValues[Units.Metrical]
                        ['minWeight'] +
                    ' - ' +
                    boundWeightValues[Units.Metrical]['maxWeight'],
              ),
              SizedBox(height: 2.0),
              Center(
                child: Text(
                  '',
                  style: TextStyle(color: Colors.red, fontSize: 10.0),
                ),
              ),
              SizedBox(
                height: screenHeight / 20,
              ),
            ],
          );
        } else if (state is CalculationInputChanged) {
          return Column(
            children: [
              SizedBox(
                height: screenHeight / 15,
              ),
              CustomNumericTextField(
                textEditingController: heightController,
                onChanged: (value) {
                  if (double.tryParse(value) != null) {
                    _enteredHeight = value.toString().replaceAll(',', '.');
                    BlocProvider.of<CalculatorBloc>(context)
                        .add(EnterHeight(height: _enteredHeight));
                  }
                },
                hint: 'Enter your height',
                textFieldDescription: 'Height',
                textFieldBounds: boundHeightValues[state.calculatorModel.unit]
                        ['minHeight'] +
                    ' - ' +
                    boundHeightValues[state.calculatorModel.unit]['maxHeight'],
              ),
              SizedBox(height: 2.0),
              Center(
                child: Text(
                  state.calculatorModel.heightError ? _heightError : '',
                  style: TextStyle(color: Colors.red, fontSize: 10.0),
                ),
              ),
              SizedBox(
                height: screenHeight / 20,
              ),
              CustomNumericTextField(
                textEditingController: weightController,
                onChanged: (value) {
                  if (double.tryParse(value) != null) {
                    _enteredWeight = value.toString().replaceAll(',', '.');

                    BlocProvider.of<CalculatorBloc>(context).add(
                      EnterWeight(weight: _enteredWeight),
                    );
                  }
                },
                hint: 'Enter your weight',
                textFieldDescription: 'Weight',
                textFieldBounds: boundWeightValues[state.calculatorModel.unit]
                        ['minWeight'] +
                    ' - ' +
                    boundWeightValues[state.calculatorModel.unit]['maxWeight'],
              ),
              SizedBox(height: 2.0),
              Center(
                child: Text(
                  state.calculatorModel.weightError ? _weightError : '',
                  style: TextStyle(color: Colors.red, fontSize: 10.0),
                ),
              ),
              SizedBox(
                height: screenHeight / 20,
              ),
            ],
          );
        }
        return null;
      },
    );
  }
}

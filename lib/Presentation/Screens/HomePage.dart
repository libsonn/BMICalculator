import 'package:bmi_calculator/Logic/cubit/calculator_cubit.dart';
import 'package:bmi_calculator/Presentation/Widgets/CalculateButton.dart';
import 'package:bmi_calculator/Presentation/Widgets/CustomNumericTextField.dart';
import 'package:bmi_calculator/Presentation/Widgets/ResultBottomSheet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _heightError = 'Value is incorrect!';
    String _weightError = 'Value is incorrect!';

    String _enteredHeight = '';
    String _enteredWeight = '';

    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    TextEditingController _heightController = TextEditingController();
    TextEditingController _weightController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: _screenHeight / 1.3,
            width: _screenWidth,
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                      child: BlocBuilder<CalculatorCubit, CalculatorState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text(
                                'BMI CALCULATOR',
                                style: TextStyle(
                                    color: deepAquaColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: _screenHeight / 25),
                              )),
                              SizedBox(
                                height: _screenHeight / 15,
                              ),
                              CustomNumericTextField(
                                  textEditingController: _heightController,
                                  onChanged: (value) {
                                    _enteredHeight =
                                        value.toString().replaceAll(',', '.');
                                    BlocProvider.of<CalculatorCubit>(context)
                                        .enterHeight(height: _enteredHeight);
                                  },
                                  hint: 'Enter your height',
                                  textFieldDescription: 'Height',
                                  textFieldBounds:
                                      boundHeightValues[state.unit]),
                              SizedBox(height: 2.0),
                              Center(
                                child: Text(
                                  state.heightError ? _heightError : '',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10.0),
                                ),
                              ),
                              SizedBox(
                                height: _screenHeight / 20,
                              ),
                              CustomNumericTextField(
                                textEditingController: _weightController,
                                onChanged: (value) {
                                  _enteredWeight =
                                      value.toString().replaceAll(',', '.');

                                  BlocProvider.of<CalculatorCubit>(context)
                                      .enterWeight(weight: _enteredWeight);
                                },
                                hint: 'Enter your weight',
                                textFieldDescription: 'Weight',
                                textFieldBounds: boundWeightValues[state.unit],
                              ),
                              SizedBox(height: 2.0),
                              Center(
                                child: Text(
                                  state.weightError ? _weightError : '',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10.0),
                                ),
                              ),
                              SizedBox(
                                height: _screenHeight / 20,
                              ),
                              Center(
                                child: Container(
                                  height: 220,
                                  width: _screenWidth / 1.5,
                                  child: ListView(
                                    children: [
                                      CheckboxListTile(
                                        activeColor: waveColor,
                                        value: state.unit == Units.Metrical,
                                        onChanged: (value) {
                                          BlocProvider.of<CalculatorCubit>(
                                                  context)
                                              .changeUnit(Units.Metrical);

                                          _heightController.text =
                                              state.height.toString();
                                          _weightController.text =
                                              state.weight.toString();
                                        },
                                        title: Text('Metrical Units'),
                                      ),
                                      CheckboxListTile(
                                        activeColor: waveColor,
                                        value: state.unit == Units.Imperial,
                                        onChanged: (value) {
                                          BlocProvider.of<CalculatorCubit>(
                                                  context)
                                              .changeUnit(Units.Imperial);

                                          _heightController.text =
                                              state.height.toString();
                                          _weightController.text =
                                              state.weight.toString();
                                        },
                                        title: Text('Imperial Units'),
                                      ),
                                      CheckboxListTile(
                                        activeColor: waveColor,
                                        value: state.unit == Units.OldPolish,
                                        onChanged: (value) {
                                          BlocProvider.of<CalculatorCubit>(
                                                  context)
                                              .changeUnit(Units.OldPolish);

                                          _heightController.text =
                                              state.height.toString();
                                          _weightController.text =
                                              state.weight.toString();
                                        },
                                        title: Text('Old polish Units'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: _screenWidth,
              color: waveColor,
              child: Center(
                child: Container(
                  height: _screenHeight / 15,
                  width: _screenWidth / 1.2,
                  child: BlocBuilder<CalculatorCubit, CalculatorState>(
                    builder: (context, state) {
                      return CalculateButton(
                        onPressed: () {
                          BlocProvider.of<CalculatorCubit>(context)
                              .validateHeight();
                          BlocProvider.of<CalculatorCubit>(context)
                              .validateWeight();

                          if (!state.heightError && !state.weightError) {
                            BlocProvider.of<CalculatorCubit>(context)
                                .calculateResult();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                backgroundColor: state.result.color,
                                builder: (BuildContext context) {
                                  return ResultBottomSheet(
                                    screenHeight: _screenHeight,
                                    bmiResult: state.result,
                                  );
                                });
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:bmi_calculator/Presentation/widgets/unit_select_checkboxes.dart';
import 'package:bmi_calculator/logic/bloc/calculator_bloc.dart';
import 'package:bmi_calculator/logic/calculator_logic.dart';
import 'package:bmi_calculator/presentation/widgets/data_inputs.dart';
import 'package:bmi_calculator/presentation/widgets/live_result_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    TextEditingController _heightController = TextEditingController();
    TextEditingController _weightController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => CalculatorBloc(
          calculatorLogic: new CalculatorLogic(),
        ),
        child: Column(
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
                        padding:
                            EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'BMI CALCULATOR',
                                style: TextStyle(
                                    color: deepAquaColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: _screenHeight / 25),
                              ),
                            ),
                            DataInputs(
                                screenHeight: _screenHeight,
                                heightController: _heightController,
                                weightController: _weightController),
                            UnitSelectCheckboxes(
                                screenWidth: _screenWidth,
                                heightController: _heightController,
                                weightController: _weightController),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            LiveResultData(
                screenWidth: _screenWidth, screenHeight: _screenHeight),
          ],
        ),
      ),
    );
  }
}

import 'package:bmi_calculator/Classes/CalculatorLogic.dart';
import 'package:bmi_calculator/Widgets/CalculateButton.dart';
import 'package:bmi_calculator/Widgets/CustomNumericTextField.dart';
import 'package:bmi_calculator/Widgets/ResultBottomSheet.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switchToImperialUnits = false;
  String _heightError = '';
  String _weightError = '';

  String _enteredHeight = '';
  String _enteredWeight = '';

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  CalculatorLogic _calculatorLogic = CalculatorLogic();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: _screenHeight / 1.5,
              width: _screenWidth,
              child: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
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
                            SizedBox(
                              height: _screenHeight / 15,
                            ),
                            CustomNumericTextField(
                              onChanged: (value) {
                                _enteredHeight =
                                    value.toString().replaceAll(',', '.');
                              },
                              controller: _heightController,
                              hint: 'Enter your height',
                              textFieldDescription: 'Height',
                              textFieldBounds: !_switchToImperialUnits
                                  ? '100 cm - 220 cm'
                                  : '3 feet - 7 feet',
                              validationError: _heightError,
                            ),
                            SizedBox(
                              height: _screenHeight / 20,
                            ),
                            CustomNumericTextField(
                              onChanged: (value) {
                                _enteredWeight =
                                    value.toString().replaceAll(',', '.');
                              },
                              controller: _weightController,
                              hint: 'Enter your weight',
                              textFieldDescription: 'Weight',
                              textFieldBounds: !_switchToImperialUnits
                                  ? '20 kg - 300 kg'
                                  : '44 lb - 661 lb',
                              validationError: _weightError,
                            ),
                            SizedBox(
                              height: _screenHeight / 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Metrical units',
                                  style: TextStyle(
                                      fontSize: _screenWidth / 20,
                                      color: deepAquaColor),
                                ),
                                Switch(
                                  value: _switchToImperialUnits,
                                  inactiveTrackColor: seafoamColor,
                                  activeTrackColor: deepAquaColor,
                                  activeColor: waveColor,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        //Change value of bool variable
                                        _switchToImperialUnits = value;

                                        //Convert values to selected units
                                        if (_enteredHeight != '') {
                                          _enteredHeight = _calculatorLogic
                                              .convertHeightUnits(
                                                  height: _enteredHeight,
                                                  toImperialUnits:
                                                      _switchToImperialUnits);
                                          _heightController.text =
                                              _enteredHeight.toString();
                                        }
                                        if (_enteredWeight != '') {
                                          _enteredWeight = _calculatorLogic
                                              .convertWeightUnits(
                                                  weight: _enteredWeight,
                                                  toImperialUnits:
                                                      _switchToImperialUnits);
                                          _weightController.text =
                                              _enteredWeight.toString();
                                        }
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  'Imperial units',
                                  style: TextStyle(
                                      fontSize: _screenWidth / 20,
                                      color: deepAquaColor),
                                ),
                              ],
                            ),
                          ],
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
                    child: CalculateButton(
                      onPressed: () {
                        //Check if height is a correct value, if not show an arror
                        !_calculatorLogic.validateHeight(
                                height: _enteredHeight,
                                imperialUnits: _switchToImperialUnits)
                            ? _heightError = 'Incorrect height value'
                            : _heightError = '';

                        //Check if weight is a correct value, if not show an arror
                        !_calculatorLogic.validateWeight(
                                weight: _enteredWeight,
                                imperialUnits: _switchToImperialUnits)
                            ? _weightError = 'Incorrect weight value'
                            : _weightError = '';

                        //Reload state
                        setState(() {});

                        //Check if both values were validated and caluclate, show if are correct
                        if (_heightError == '' && _weightError == '') {
                          _calculatorLogic.calculateResult(
                              height: _enteredHeight,
                              weight: _enteredWeight,
                              imperialUnits: _switchToImperialUnits);

                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            backgroundColor:
                                _calculatorLogic.getBMIResult().color,
                            builder: (BuildContext context) {
                              return ResultBottomSheet(
                                  screenHeight: _screenHeight,
                                  calculatorLogic: _calculatorLogic);
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

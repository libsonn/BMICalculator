import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/logic/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveResultData extends StatelessWidget {
  const LiveResultData({
    @required this.screenWidth,
    @required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        if (state is CalculatorInitialState) {
          return Expanded(
            child: Container(
              width: screenWidth,
              color: waveColor,
              child: Center(
                child: Container(
                  height: screenHeight / 13,
                  width: screenWidth / 1.2,
                  child: Center(
                    child: Container(),
                  ),
                ),
              ),
            ),
          );
        } else if (state is CalculationInputChanged) {
          return Expanded(
            child: Container(
              width: screenWidth,
              color: state.calculatorModel.result.value != 0.0
                  ? state.calculatorModel.result.color
                  : waveColor,
              child: Center(
                child: Container(
                  height: screenHeight / 13,
                  width: screenWidth / 1.2,
                  child: Center(
                    child: state.calculatorModel.result.value != 0.0
                        ? Column(
                            children: [
                              Text(
                                state.calculatorModel.result.value
                                    .toStringAsFixed(1),
                                style: TextStyle(
                                    color: deepAquaColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenHeight / 25),
                              ),
                              Text(
                                state.calculatorModel.result.description,
                                style: TextStyle(
                                    color: deepAquaColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenHeight / 50),
                              ),
                            ],
                          )
                        : Container(),
                  ),
                ),
              ),
            ),
          );
        }
        return null;
      },
    );
  }
}

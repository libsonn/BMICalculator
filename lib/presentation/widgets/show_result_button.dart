import 'package:bmi_calculator/Presentation/widgets/calculate_button.dart';
import 'package:bmi_calculator/Presentation/widgets/result_bottom_sheet.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/logic/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowResultButton extends StatelessWidget {
  const ShowResultButton({
    @required this.screenWidth,
    @required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      color: waveColor,
      child: Center(
        child: Container(
          height: screenHeight / 15,
          width: screenWidth / 1.2,
          child: BlocBuilder<CalculatorBloc, CalculatorState>(
            builder: (context, state) {
              return CalculateButton(
                onPressed: () {
                  if (!state.calculatorModel.heightError &&
                      !state.calculatorModel.weightError) {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        backgroundColor: state.calculatorModel.result.color,
                        builder: (BuildContext context) {
                          return ResultBottomSheet(
                            screenHeight: screenHeight,
                            bmiResult: state.calculatorModel.result,
                          );
                        });
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

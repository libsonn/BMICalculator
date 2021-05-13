import 'package:bmi_calculator/Logic/BMI.dart';
import 'package:flutter/material.dart';

class ResultBottomSheet extends StatelessWidget {
  ResultBottomSheet({@required this.screenHeight, @required this.bmiResult});

  final double screenHeight;
  final BMIResult bmiResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight - screenHeight / 3,
      child: Column(
        children: [
          Container(
            height: screenHeight / 3,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'BMI Value',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                Text(
                  bmiResult.result.toStringAsFixed(1),
                  style: TextStyle(fontSize: 70.0, color: Colors.white),
                ),
                Text(
                  bmiResult.description,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeight / 3,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Recalculate',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.grey),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          bmiResult.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

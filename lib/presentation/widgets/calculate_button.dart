import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({@required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        'Calculate',
        style: TextStyle(fontSize: 30),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        shadowColor: MaterialStateProperty.all<Color>(Colors.grey),
        foregroundColor: MaterialStateProperty.all<Color>(deepAquaColor),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );
  }
}

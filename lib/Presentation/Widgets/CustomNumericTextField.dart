import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumericTextField extends StatelessWidget {
  CustomNumericTextField(
      {@required this.onChanged,
      @required this.hint,
      @required this.textFieldDescription,
      @required this.textFieldBounds,
      @required this.textEditingController});

  final Function onChanged;
  final String hint;
  final String textFieldDescription;
  final String textFieldBounds;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textFieldDescription,
                  style: TextStyle(
                    color: deepAquaColor,
                    fontSize: 15.0,
                  ),
                ),
                Text(
                  textFieldBounds,
                  style: TextStyle(
                    color: deepAquaColor,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: waveColor,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  )
                ],
                color: seafoamColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 2.0),
                child: TextField(
                  controller: textEditingController,
                  cursorColor: deepAquaColor,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: deepAquaColor),
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: TextStyle(color: waveColor),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.|\d+\,?\d*')),
                  ],
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

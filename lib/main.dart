import 'package:bmi_calculator/Logic/cubit/calculator_cubit.dart';
import 'package:bmi_calculator/Presentation/Screens/HomePage.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BMICalculator());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: waveColor,
          accentColor: deepAquaColor,
        ),
        title: 'BMI Calculator',
        home: HomePage(),
      ),
    );
  }
}

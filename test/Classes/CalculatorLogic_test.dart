import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/Classes/CalculatorLogic.dart';

void main() {
  //Test if function that converts height works properly
  group('getConvertedHeightValue', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('return correct values', () {
      expect(
          calculatorLogic.convertHeightUnits(
              height: '169.0', toImperialUnits: true),
          equals('5.5'));
      expect(
          calculatorLogic.convertHeightUnits(
              height: '5.5', toImperialUnits: false),
          equals('167.6'));
      expect(
          calculatorLogic.convertHeightUnits(
              height: '2..2', toImperialUnits: false),
          equals('0.0'));
      expect(
          calculatorLogic.convertHeightUnits(
              height: '3.4', toImperialUnits: false),
          equals('103.6'));
      expect(
          calculatorLogic.convertHeightUnits(
              height: '180.8', toImperialUnits: true),
          equals('5.9'));
    });
  });

  //Test if function that converts weight works properly
  group('getConvertedWeightValue', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('return correct values', () {
      expect(
          calculatorLogic.convertWeightUnits(
              weight: '75', toImperialUnits: true),
          equals('165.3'));
      expect(
          calculatorLogic.convertWeightUnits(
              weight: '112', toImperialUnits: false),
          equals('50.8'));
      expect(
          calculatorLogic.convertWeightUnits(
              weight: '2..2', toImperialUnits: false),
          equals('0.0'));
      expect(
          calculatorLogic.convertWeightUnits(
              weight: '88.2', toImperialUnits: true),
          equals('194.4'));
      expect(
          calculatorLogic.convertWeightUnits(
              weight: '350.2', toImperialUnits: false),
          equals('158.8'));
    });
  });

  //Test if function that validates height works properly
  group('validateHeight', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('return if the value is correct', () {
      expect(
          calculatorLogic.validateHeight(height: '110', imperialUnits: false),
          equals(true));
      expect(
          calculatorLogic.validateHeight(height: '5.7', imperialUnits: false),
          equals(false));
      expect(calculatorLogic.validateHeight(height: '5', imperialUnits: true),
          equals(true));
    });
  });

  //Test if function that validates weight works properly
  group('validateWeight', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('return if the value is correct', () {
      expect(
          calculatorLogic.validateWeight(weight: '30.0', imperialUnits: true),
          equals(false));
      expect(calculatorLogic.validateWeight(weight: '32', imperialUnits: false),
          equals(true));
      expect(calculatorLogic.validateWeight(weight: 'a', imperialUnits: false),
          equals(false));
      expect(calculatorLogic.validateWeight(weight: '661', imperialUnits: true),
          equals(true));
      expect(calculatorLogic.validateWeight(weight: '662', imperialUnits: true),
          equals(false));
    });
  });

  //Test if results are correct
  group('isBMIResultCorrect', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();

    test('value should be 27.5', () {
      calculatorLogic.calculateResult(
          height: '165', weight: '75', imperialUnits: false);
      expect(calculatorLogic.getBMIResult().description, 'Overweight');
    });
    test('should be overweight', () {
      calculatorLogic.calculateResult(
          height: '165', weight: '75', imperialUnits: false);
      expect(calculatorLogic.getBMIResult().description, 'Overweight');
    });
    test('value should be 15.0', () {
      calculatorLogic.calculateResult(
          height: '5', weight: '77', imperialUnits: true);
      expect(calculatorLogic.getBMIResult().result.toStringAsFixed(1), '15.0');
    });
    test('should be underweight', () {
      calculatorLogic.calculateResult(
          height: '5', weight: '77', imperialUnits: true);
      expect(calculatorLogic.getBMIResult().description, 'Underweight');
    });
    test('should be class 3 obesity', () {
      calculatorLogic.calculateResult(
          height: '120', weight: '200', imperialUnits: false);
      expect(calculatorLogic.getBMIResult().description, 'Class 3 Obesity');
    });
  });
}

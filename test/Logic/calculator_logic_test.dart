import 'package:bmi_calculator/logic/calculator_logic.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Test if function that converts height works properly
  group('getConvertedHeightValue', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('return correct values', () {
      //Metrical -> Imperial
      expect(
          calculatorLogic
              .convertHeightUnits(
                  height: 169.0,
                  previousUnits: Units.Metrical,
                  selectedUnits: Units.Imperial)
              .toStringAsFixed(1),
          equals('5.5'));
      //Metrical -> OldPolish
      expect(
          calculatorLogic
              .convertHeightUnits(
                  height: 169.0,
                  previousUnits: Units.Metrical,
                  selectedUnits: Units.OldPolish)
              .toStringAsFixed(1),
          equals('2.8'));
      //Imperial -> Metrical
      expect(
          calculatorLogic
              .convertHeightUnits(
                  height: 5.5,
                  previousUnits: Units.Imperial,
                  selectedUnits: Units.Metrical)
              .toStringAsFixed(1),
          equals('167.6'));
      //Imperial -> OldPolish
      expect(
          calculatorLogic
              .convertHeightUnits(
                  height: 5.5,
                  previousUnits: Units.Imperial,
                  selectedUnits: Units.OldPolish)
              .toStringAsFixed(1),
          equals('2.8'));
      //OldPolish -> Metrical
      expect(
          calculatorLogic
              .convertHeightUnits(
                  height: 2.8,
                  previousUnits: Units.OldPolish,
                  selectedUnits: Units.Metrical)
              .toStringAsFixed(1),
          equals('166.7'));
      //OldPolish -> Imperial
      expect(
          calculatorLogic
              .convertHeightUnits(
                  height: 2.8,
                  previousUnits: Units.OldPolish,
                  selectedUnits: Units.Imperial)
              .toStringAsFixed(1),
          equals('5.5'));
    });
  });

  //Test if function that converts weight works properly
  group('getConvertedWeightValue', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('return correct values', () {
      //Metrical -> Imperial
      expect(
          calculatorLogic
              .convertWeightUnits(
                  weight: 75.2,
                  previousUnits: Units.Metrical,
                  selectedUnits: Units.Imperial)
              .toStringAsFixed(1),
          equals('165.8'));
      //Metrical -> OldPolish
      expect(
          calculatorLogic
              .convertWeightUnits(
                  weight: 165.8,
                  previousUnits: Units.Metrical,
                  selectedUnits: Units.OldPolish)
              .toStringAsFixed(1),
          equals('409.2'));

      //Impreial -> Metrical
      expect(
          calculatorLogic
              .convertWeightUnits(
                  weight: 165.8,
                  previousUnits: Units.Imperial,
                  selectedUnits: Units.Metrical)
              .toStringAsFixed(1),
          equals('75.2'));
      //Impreial -> OldPolish
      expect(
          calculatorLogic
              .convertWeightUnits(
                  weight: 165.8,
                  previousUnits: Units.Imperial,
                  selectedUnits: Units.OldPolish)
              .toStringAsFixed(1),
          equals('185.6'));

      //OldPolish -> Metrical
      expect(
          calculatorLogic
              .convertWeightUnits(
                  weight: 185.8,
                  previousUnits: Units.OldPolish,
                  selectedUnits: Units.Metrical)
              .toStringAsFixed(1),
          equals('75.3'));
      //OldPolish -> Imperial
      expect(
          calculatorLogic
              .convertWeightUnits(
                  weight: 185.8,
                  previousUnits: Units.OldPolish,
                  selectedUnits: Units.Imperial)
              .toStringAsFixed(1),
          equals('166.0'));
    });
  });

  //Test if function that validates height works properly
  group('validateHeight', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('validate metrical height', () {
      expect(
          calculatorLogic.validateHeight(
              height: '80', selectedUnits: Units.Metrical),
          equals(false));
      expect(
          calculatorLogic.validateHeight(
              height: '100', selectedUnits: Units.Metrical),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '110', selectedUnits: Units.Metrical),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '220', selectedUnits: Units.Metrical),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '221', selectedUnits: Units.Metrical),
          equals(false));
    });
    test('validate imperial height', () {
      expect(
          calculatorLogic.validateHeight(
              height: '2.9', selectedUnits: Units.Imperial),
          equals(false));
      expect(
          calculatorLogic.validateHeight(
              height: '3.3', selectedUnits: Units.Imperial),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '4.5', selectedUnits: Units.Imperial),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '7.2', selectedUnits: Units.Imperial),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '7.3', selectedUnits: Units.Imperial),
          equals(false));
    });

    test('validate old polish height', () {
      expect(
          calculatorLogic.validateHeight(
              height: '1.6', selectedUnits: Units.OldPolish),
          equals(false));
      expect(
          calculatorLogic.validateHeight(
              height: '1.7', selectedUnits: Units.OldPolish),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '2.5', selectedUnits: Units.OldPolish),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '3.6', selectedUnits: Units.OldPolish),
          equals(true));
      expect(
          calculatorLogic.validateHeight(
              height: '3.8', selectedUnits: Units.OldPolish),
          equals(false));
    });
  });

  group('validateWeight', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('validate metrical weight', () {
      expect(
          calculatorLogic.validateWeight(
              weight: '19', selectedUnits: Units.Metrical),
          equals(false));
      expect(
          calculatorLogic.validateWeight(
              weight: '20', selectedUnits: Units.Metrical),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '100', selectedUnits: Units.Metrical),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '300', selectedUnits: Units.Metrical),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '301', selectedUnits: Units.Metrical),
          equals(false));
    });
    test('validate imperial weight', () {
      expect(
          calculatorLogic.validateWeight(
              weight: '43', selectedUnits: Units.Imperial),
          equals(false));
      expect(
          calculatorLogic.validateWeight(
              weight: '45', selectedUnits: Units.Imperial),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '400', selectedUnits: Units.Imperial),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '661', selectedUnits: Units.Imperial),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '662', selectedUnits: Units.Imperial),
          equals(false));
    });

    test('validate old polish weight', () {
      expect(
          calculatorLogic.validateWeight(
              weight: '49', selectedUnits: Units.OldPolish),
          equals(false));
      expect(
          calculatorLogic.validateWeight(
              weight: '50', selectedUnits: Units.OldPolish),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '100', selectedUnits: Units.OldPolish),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '740', selectedUnits: Units.OldPolish),
          equals(true));
      expect(
          calculatorLogic.validateWeight(
              weight: '741', selectedUnits: Units.OldPolish),
          equals(false));
    });
  });

  group('validate results', () {
    CalculatorLogic calculatorLogic = CalculatorLogic();
    test('validate description', () {
      expect(
          calculatorLogic
              .calculateResult(
                  height: 170.0, weight: 75.0, unit: Units.Metrical)
              .description,
          equals('Overweight'));
      expect(
          calculatorLogic
              .calculateResult(
                  height: 170.0, weight: 70.0, unit: Units.Metrical)
              .description,
          equals('Healthy weight'));

      expect(
          calculatorLogic
              .calculateResult(height: 5.5, weight: 165, unit: Units.Imperial)
              .description,
          equals('Overweight'));
      expect(
          calculatorLogic
              .calculateResult(height: 3.3, weight: 661, unit: Units.Imperial)
              .description,
          equals('Class 3 Obesity'));

      expect(
          calculatorLogic
              .calculateResult(height: 3.7, weight: 55, unit: Units.OldPolish)
              .description,
          equals('Underweight'));

      expect(
          calculatorLogic
              .calculateResult(height: 1.7, weight: 740, unit: Units.OldPolish)
              .description,
          equals('Class 3 Obesity'));
    });
  });
}

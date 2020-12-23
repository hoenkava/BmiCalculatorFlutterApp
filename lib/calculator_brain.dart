import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterPretation() {
    if (_bmi >= 25) {
      return 'You have more weight then normal weight, Try to excercise more 😥';
    } else if (_bmi >= 18.5) {
      return 'You hae normal weight. Good Job 👍';
    } else {
      return 'You are underweight. Eat More Drink More Juice👼';
    }
  }
}

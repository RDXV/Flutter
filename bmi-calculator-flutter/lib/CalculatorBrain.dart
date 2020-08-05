import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  Calculator(this.height, this.weight);
  double _bmi;
  String calculateBMI() {
    _bmi = weight / (pow((height / 100), 2));
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String resultMeaning() {
    if (_bmi >= 25) {
      return 'You have more weight than you should have. exercise more and eat healthy food';
    } else if (_bmi >= 18.5) {
      return 'Your weight is good. Maintain the weight and eat healthy to remain the way you are';
    } else {
      return 'You have less weight than you should have. Try eating more food and be healthy';
    }
  }
}

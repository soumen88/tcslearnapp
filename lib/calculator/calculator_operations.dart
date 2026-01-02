import 'dart:math' as math;

class CalculatorOperations {

  double addNumbers(double numberOne, double numberTwo){
    return numberOne + numberTwo;
  }

  double subtractNumbers(double numberOne, double numberTwo){
    return numberOne - numberTwo;
  }

  double multiplyNumbers(double numberOne, double numberTwo){
    return numberOne * numberTwo;
  }

  double divideNumbers(double numberOne, double numberTwo){
    return numberOne / numberTwo;
  }

  num power(double number, double radix){
    num powerAnswer = math.pow(number, radix);
    return powerAnswer;
  }
}
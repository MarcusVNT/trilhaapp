import 'dart:math';

class GenerateRandomNumber {
  static int generateRandomNumber(int maxNumber) {
    Random randomNumber = Random();
    return randomNumber.nextInt(maxNumber);
  }
}

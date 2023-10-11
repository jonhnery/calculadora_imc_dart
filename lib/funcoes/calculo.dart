import 'dart:math';

class Calculo {
  static double calcularimc(double peso, double altura) {
    double imc = peso / pow(altura, 2);
    return imc;
  }
}

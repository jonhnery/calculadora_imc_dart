import 'dart:io';

import 'package:calculadora_imc/excecao/exception.dart';
import 'package:calculadora_imc/funcoes/calculo.dart';
import 'package:calculadora_imc/funcoes/funcoes.dart';
import 'package:calculadora_imc/models/pessoa.dart';

void main(List<String> arguments) {
  print('Calculadora IMC');

  String nome = Console.lerStringTexto("Digite o seu nome: ");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } on NomeInvalidoException {
    print(NomeInvalidoException);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  var pessoa = Pessoa(nome);
  double? peso =
      Console.lerDoublecomTextoeSaida("Digite o peso em kilos: ", "S");
  double? altura = Console.lerDoublecomTextoeSaida(
      "Digite a altura em metros ou S para sair: ", "S");

  if (peso == null || altura == null) {
    exitCode;
  } else {
    double imc = Calculo.calcularimc(peso, altura);

    if (imc < 16) {
      print(
          "${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}, você está com Magreza grave");
    }
    if (imc >= 16 && imc < 17) {
      print(
          "${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}, você está com Magreza moderada");
    }
    if (imc >= 17 && imc < 18.5) {
      print(
          "${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}, você está com Magreza leve");
    }
    if (imc >= 18.5 && imc < 25) {
      print(
          "${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}, você está Saudável");
    }
    if (imc >= 25 && imc < 30) {
      print(
          "${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}, você está com Sobrepeso");
    }
    if (imc >= 30 && imc < 35) {
      print(
          "${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}, você está com Obesidade Grau I");
    }
    if (imc >= 35 && imc < 40) {
      print(
          "${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}, você está com Obesidade Grau II (severa)");
    }
    if (imc >= 40) {
      print(
          "${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}, você está com Obesidade Grau III (mórbida)");
    }
  }
}

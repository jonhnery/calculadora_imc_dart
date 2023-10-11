import 'dart:convert';
import 'dart:io';

class Console {
  static String lerStringTexto(String texto) {
    print(texto);
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? lerDouble() {
    var valor = lerString();
    try {
      return double.parse(valor);
    } catch (e) {
      return null;
    }
  }

  static double? lerDoublecomTexto(String texto) {
    print(texto);
    return lerDouble();
  }

  static double? lerDoublecomTextoeSaida(String texto, String valorSaida) {
    do {
      try {
        var valor = lerStringTexto(texto);
        if (valor == valorSaida) {
          print("Saindo do programa");
          return null;
        }
        if (valor == 0) {
          print("Valor não pode ser 0");
        }
        return double.parse(valor);
      } catch (e) {
        print("Valor Inválido");
      }
    } while (true);
  }
}

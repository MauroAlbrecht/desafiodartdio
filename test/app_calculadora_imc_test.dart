import 'dart:ffi';

import 'package:app_calculadora_imc/app_calculadora_imc.dart';
import 'package:app_calculadora_imc/exception/custom_exception.dart';
import 'package:app_calculadora_imc/models/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('Valida dado informado passando null', () {
    expect(() => validaDadoInformadoDisparaException(null, "Erro"), throwsA(isA<CustomException>()));
  });

  test('Valida dado informado passando vazio', () {
    expect(() => validaDadoInformadoDisparaException('', "Erro"), throwsA(isA<CustomException>()));
  });

  test('Valida dado informado com valor válido', () {
    expect(() => validaDadoInformadoDisparaException('Valor Informado', "Erro"), returnsNormally);
  });

  test('Teste o a mensagem do resultado do cálculo do imc', () {
    expect(() => printResultadoImc(15), prints('Magreza grave\n'));
    expect(() => printResultadoImc(16.5), prints('Magreza moderada\n'));
    expect(() => printResultadoImc(18), prints('Magreza leve\n'));
    expect(() => printResultadoImc(22), prints('Saudável\n'));
    expect(() => printResultadoImc(28), prints('Sobrepeso\n'));
    expect(() => printResultadoImc(33), prints('Obesidade Grau I\n'));
    expect(() => printResultadoImc(37.5), prints('Obesidade Grau II(severa)\n'));
    expect(() => printResultadoImc(42), prints('Obesidade Grau II(mórbida)\n'));
  });

  test('Calcula IMC corretamente', () {
    var resultado = calculaIMC(Pessoa('Mauro', 1.70, 40.0));
    expect(resultado, equals(13.84));

    resultado = calculaIMC(Pessoa('Mauro', 1.70, 45.0));
    expect(resultado, equals(15.57));

    resultado = calculaIMC(Pessoa('Mauro', 1.70, 50.0));
    expect(resultado, equals(17.30));

    resultado = calculaIMC(Pessoa('Mauro', 1.70, 70.0));
    expect(resultado, equals(24.22));

    resultado = calculaIMC(Pessoa('Mauro', 1.70, 80.0));
    expect(resultado, equals(27.68));

    resultado = calculaIMC(Pessoa('Mauro', 1.70, 95.0));
    expect(resultado, equals(32.87));

    resultado = calculaIMC(Pessoa('Mauro', 1.70, 110.0));
    expect(resultado, equals(38.06));

    resultado = calculaIMC(Pessoa('Mauro', 1.70, 130));
    expect(resultado, equals(44.98));
  });
}

import 'package:app_calculadora_imc/exception/custom_exception.dart';
import 'package:app_calculadora_imc/models/pessoa.dart';
import 'package:app_calculadora_imc/utils/console_utils.dart';

void lerDadosECalculaIMC() {

  try {

    String nome = ConsoleUtils.lerStringComMsg("Digite nome da pessoa:");
    validaDadoInformadoDisparaException(nome, "O nome é obrigatório.");

    double? peso = ConsoleUtils.lerDoubleComMsg("Digite o peso:");
    validaDadoInformadoDisparaException(peso, "O peso é obrigatório.");

    double? altura = ConsoleUtils.lerDoubleComMsg("Digite a altura:");
    validaDadoInformadoDisparaException(peso, "A altura é obrigatória.");

    Pessoa pessoa = Pessoa(nome, altura!, peso!);

    var imc = calculaIMC(pessoa);

    printResultadoImc(imc);
  }
  on CustomException catch (e){
    print(e.erro);
  }
  on Exception catch (e){
    print(e.toString());
  }

}

void validaDadoInformadoDisparaException(dynamic valor, String msg) {
  if(valor == null || valor.isEmpty){
    throw CustomException(msg);
  }
}

void printResultadoImc(double imc) {
  if (imc < 16) {
    print('Magreza grave');
  } else if (imc >= 16 && imc < 17) {
    print('Magreza moderada');
  } else if (imc >= 17 && imc < 18.5) {
    print('Magreza leve');
  } else if (imc >= 18.5 && imc < 25) {
    print('Saudável');
  } else if (imc >= 25 && imc < 30) {
    print('Sobrepeso');
  } else if (imc >= 30 && imc < 35) {
    print('Obesidade Grau I');
  } else if (imc >= 35 && imc < 40) {
    print('Obesidade Grau II(severa)');
  } else if (imc >= 40) {
    print('Obesidade Grau II(mórbida)');
  }
}

double calculaIMC(Pessoa pessoa) {
  return pessoa.peso / (pessoa.altura * pessoa.altura);
}

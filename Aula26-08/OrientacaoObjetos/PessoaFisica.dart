import 'Pessoa.dart';

class PessoaFisica extends Pessoa {
  String cpf;
  String rg;

  PessoaFisica({String nome, double renda, int situacao, String cpf, String rg})
      : super(nome: nome, renda: renda, situacao: situacao) {
    this.cpf = cpf;
    this.rg = rg;
  }
}

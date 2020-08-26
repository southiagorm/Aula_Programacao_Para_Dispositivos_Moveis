import 'Conta.dart';
import 'Pessoa.dart';
import 'PessoaFisica.dart';

main() {
  Pessoa pessoa = new Pessoa(nome: "Joao", renda: 2000);
  PessoaFisica pf = new PessoaFisica(nome: "João", cpf: "087454542122");
  Conta conta = new Conta(123, DateTime.now(), 1, "1234", pf);
  conta.depositar(2000);
  print(conta.getSaldo());
}

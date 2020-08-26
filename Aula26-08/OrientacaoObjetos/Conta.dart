import 'Pessoa.dart';

class Conta {
  int numero;
  DateTime dataHoraAbertura;
  DateTime dataHoraFechamento;
  int situacao;
  String senha;
  double _saldo;
  Pessoa pessoa;

  Conta(int numero, DateTime dataAbertura, int situacao, String senha,
      Pessoa pessoa,
      {DateTime dataFechamento = null, double saldo = 0.0}) {
    this.numero = numero;
    this.dataHoraAbertura = dataAbertura;
    this.situacao = situacao;
    this.senha = senha;
    this._saldo = saldo;
    this.pessoa = pessoa;
  }

  sacar(double value) {
    if (value <= _saldo) {
      _saldo -= value;
    } else {
      print("Saldo Insuficiente");
    }
  }

  depositar(double value) {
    _saldo += value;
  }

  getSaldo() {
    return _saldo;
  }
}

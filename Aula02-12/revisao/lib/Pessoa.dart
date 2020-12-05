class Pessoa{
  String nome;
  String cpf;

  Pessoa({this.nome, this.cpf});

  @override
  String toString() {
    return '$nome';
  }
}
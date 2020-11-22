class Contato{

  int id;
  String nome;
  String telefone;
  String email;

  Contato({this.id, this.nome, this.telefone, this.email});

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, telefone: $telefone, email: $email}';
  }
}
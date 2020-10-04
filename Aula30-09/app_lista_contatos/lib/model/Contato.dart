class Contato{
  String nome;
  String email;
  String telefone;

  Contato(String nome, String email, String telefone){
    this.nome = nome;
    this.email = email;
    this.telefone = telefone;
  }

  @override
  String toString() {
    return 'Contato{nome: $nome, email: $email, telefone: $telefone}';
  }
}
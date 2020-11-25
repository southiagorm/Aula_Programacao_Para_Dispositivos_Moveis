class Produto{

  int id;
  String nome;
  int qtde;

  Produto({this.id, this.nome, this.qtde});

  factory Produto.fromJson(Map<String, dynamic> map){
    return Produto(
      id:map["id"],
      nome: map["nome"],
      qtde: map["qtde"]
    );
  }

  @override
  String toString() {
    return 'Produto{id: $id, nome: $nome, qtde: $qtde}';
  }
}
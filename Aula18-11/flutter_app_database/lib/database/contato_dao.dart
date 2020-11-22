import 'package:flutterappdatabase/model/Contato.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class ContatoDao{

  static const String tabelaContatos = "contatos";
  static const String colunaId = "id";
  static const String colunaNome = "nome";
  static const String colunaTelefone = "telefone";
  static const String colunaEmail = "email";

  static const String criandoTabelaContatos = 'CREATE TABLE $tabelaContatos( '
      '$colunaId INTEGER PRIMARY KEY, '
      '$colunaNome TEXT, '
      '$colunaTelefone TEXT, '
      '$colunaEmail TEXT)';

  Future<int> save(Contato contato) async{
      Database db = await getDatabase();

      Map<String, dynamic> mapContato = Map();
      mapContato[colunaNome] = contato.nome;
      mapContato[colunaTelefone] = contato.telefone;
      mapContato[colunaEmail] = contato.email;

      return db.insert(tabelaContatos, mapContato);
  }

  Future<int> update(Contato contato) async{
    Database db = await getDatabase();

    Map<String, dynamic> mapContato = Map();
    mapContato[colunaNome] = contato.nome;
    mapContato[colunaTelefone] = contato.telefone;
    mapContato[colunaEmail] = contato.email;

    return db.update(tabelaContatos, mapContato, where:"id = ?", whereArgs:[contato.id]);

  }

  Future<int> remover(int id) async{
    Database db = await getDatabase();
    return db.delete(tabelaContatos,where: "id = ?", whereArgs: [id]);
  }

  Future<List<Contato>> listarTodos() async{
      Database db = await getDatabase();
      List<Map<String, dynamic>> mapContatos = await db.query(tabelaContatos);
      List<Contato> contatos = List();
      for(Map<String,dynamic> map in mapContatos){
        Contato contato = Contato(
            id: map[colunaId],
            nome: map[colunaNome],
            telefone: map[colunaTelefone],
            email: map[colunaEmail]);
        contatos.add(contato);
      }
      return contatos;
  }

}
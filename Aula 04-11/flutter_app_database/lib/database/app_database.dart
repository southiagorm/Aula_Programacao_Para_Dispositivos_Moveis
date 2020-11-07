
import 'package:flutterappdatabase/model/Contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tabelaContatos = "contatos";
final String colunaId = "id";
final String colunaNome = "nome";
final String colunaTelefone = "telefone";
final String colunaEmail = "email";

Future<Database> createDatabase(){
  return getDatabasesPath().then((dbpath){
    String path = join(dbpath, 'contatos.db');
    return openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE $tabelaContatos( '
          '$colunaId INTEGER PRIMARY KEY, '
          '$colunaNome TEXT, '
          '$colunaTelefone TEXT, '
          '$colunaEmail TEXT)');
    }, version: 1);
  });
}

Future<int> save(Contato contato){
  return createDatabase().then((db){

    Map<String, dynamic> mapContato = Map();
    mapContato[colunaNome] = contato.nome;
    mapContato[colunaTelefone] = contato.telefone;
    mapContato[colunaEmail] = contato.email;

    return db.insert(tabelaContatos, mapContato);
  });
}

Future<List<Contato>> listarTodos(){
  return createDatabase().then((db){
    return db.query(tabelaContatos).then((maps){
      List<Contato> contatos = List();
      for(Map<String,dynamic> map in maps){
        Contato contato = Contato(
            id: map[colunaId],
            nome: map[colunaNome],
            telefone: map[colunaTelefone],
            email: map[colunaEmail]);
        contatos.add(contato);
      }
      return contatos;
    });
  });
}
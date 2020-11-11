
import 'package:flutterappdatabase/database/contato_dao.dart';
import 'package:flutterappdatabase/model/Contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'contatos.db');
    return openDatabase(path, onCreate: (db, version){
      db.execute(ContatoDao.criandoTabelaContatos);
    }, version: 1);
}


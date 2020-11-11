import 'package:flutter/material.dart';
import 'package:flutterappdatabase/database/app_database.dart';
import 'package:flutterappdatabase/database/contato_dao.dart';
import 'package:flutterappdatabase/model/Contato.dart';
import 'package:flutterappdatabase/ui/listar_contatos.dart';

void main() {
  runApp(MaterialApp(
    home: ListarContatos(),
    debugShowCheckedModeBanner: false,
  ));

  //ContatoDao contatoDao = ContatoDao();

  //contatoDao.save(Contato(nome: "E", telefone: "988554411", email:"e@email.com")).then((value) => debugPrint("Inserido com Sucesso! - $value"));

  /*contatoDao.update(Contato(id:3, nome: "Joao", telefone:"988554411", email:"joao@email.com")).then((value) => {
    debugPrint("Atualizado com Sucesso!")
  });*/

  //contatoDao.remover(3).then((value) => debugPrint("Contato removido com sucesso! - $value"));

  /*contatoDao.listarTodos().then((listaContatos) => {
    debugPrint(listaContatos.toString())
  });*/

}


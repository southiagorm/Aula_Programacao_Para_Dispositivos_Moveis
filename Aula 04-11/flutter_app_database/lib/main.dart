import 'package:flutter/material.dart';
import 'package:flutterappdatabase/database/app_database.dart';
import 'package:flutterappdatabase/model/Contato.dart';
import 'package:flutterappdatabase/ui/listar_contatos.dart';

void main() {
  runApp(MaterialApp(
    home: ListarContatos(),
    debugShowCheckedModeBanner: false,
  ));

  /*save(Contato(nome: "B", telefone: "988554488", email: "b@email.com")).then((id){
    debugPrint("Inserido com Sucesso! id: $id");
  });*/

  listarTodos().then((lista){
    debugPrint(lista.toString());
  });
}


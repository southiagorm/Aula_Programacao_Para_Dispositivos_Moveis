import 'package:flutter/material.dart';
import 'package:projetoapirest/model/produto.dart';
import 'package:projetoapirest/ui/tela_login.dart';
import 'package:projetoapirest/webservice/api_produtos.dart';

void main() {
  runApp(MyApp());

  /*ApiProdutos.findById(10).then((value) => {
    if(value.ok){
      debugPrint(value.result.toString())
    }else{
      debugPrint(value.msg.toString())
    }
  });*/

  /*ApiProdutos.save(Produto(nome: "Mouse", qtde: 10)).then((value) => {
    if(value.ok){
      debugPrint("Inserido com Sucesso!")
    }else{
      debugPrint(value.msg)
    }
  });*/

  /*ApiProdutos.update(Produto(id:1, nome:"HD M2", qtde:50)).then((value) => {
    if(value.ok){
      debugPrint("Alterado com Sucesso!")
    }else{
      debugPrint(value.msg)
    }
  });*/

  ApiProdutos.delete(1).then((value) => {
    if(value.ok){
      debugPrint("Deletado com Sucesso!")
    }else{
      debugPrint(value.msg)
    }
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}

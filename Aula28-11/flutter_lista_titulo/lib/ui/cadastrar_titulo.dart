import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastrarTitulo extends StatefulWidget {
  @override
  _CadastrarTituloState createState() => _CadastrarTituloState();
}

class _CadastrarTituloState extends State<CadastrarTitulo> {

  TextEditingController edtTitulo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatActionButton(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Cadastrar Titulo"),
    );
  }

  _floatActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: (){
        Navigator.pop(context, edtTitulo.text);
      },
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: edtTitulo,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Título"
        ),
      )
    );
  }
}

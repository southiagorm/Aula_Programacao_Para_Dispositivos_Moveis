import 'package:flutter/material.dart';

class CadastrarContato extends StatefulWidget {
  @override
  _CadastrarContatoState createState() => _CadastrarContatoState();
}

class _CadastrarContatoState extends State<CadastrarContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Cadastrar Contato"),
    );
  }

  _body() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child:
              TextFormField(
                keyboardType:  TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  hintText: "Digite um Nome"
                ),
              ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child:
            TextFormField(
              keyboardType:  TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Digite um Email"
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child:
            TextFormField(
              keyboardType:  TextInputType.phone,
              decoration: InputDecoration(
                  labelText: "Telefone",
                  hintText: "Digite um Telefone"
              ),
            ),
          ),
        ],
      ),
    );
  }

  _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.save),
      onPressed: (){},
    );
  }
}

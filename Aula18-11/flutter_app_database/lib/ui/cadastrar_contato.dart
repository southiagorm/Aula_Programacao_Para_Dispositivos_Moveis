import 'package:flutter/material.dart';
import 'package:flutterappdatabase/database/contato_dao.dart';
import 'package:flutterappdatabase/model/Contato.dart';

class CadastrarContato extends StatefulWidget {

  Contato contato = null;

  CadastrarContato({this.contato});

  @override
  _CadastrarContatoState createState() => _CadastrarContatoState();
}

class _CadastrarContatoState extends State<CadastrarContato> {

  TextEditingController edtNome = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtTelefone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ContatoDao _contatoDao = ContatoDao();

  @override
  void initState() {
    super.initState();
    edtNome.text = (widget.contato == null) ? "" : widget.contato.nome;
    edtEmail.text = (widget.contato == null) ? "" : widget.contato.email;
    edtTelefone.text = (widget.contato == null) ? "" : widget.contato.telefone;
  }

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
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child:
                TextFormField(
                  controller: edtNome,
                  keyboardType:  TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      hintText: "Digite um Nome"
                  ),
                  validator: (value) => _validateNome(value),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child:
                TextFormField(
                  controller: edtEmail,
                  keyboardType:  TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Digite um Email"
                  ),
                  validator: (value) => (value.isEmpty) ? "Informe um Email" : null,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child:
                TextFormField(
                  controller: edtTelefone,
                  keyboardType:  TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Telefone",
                      hintText: "Digite um Telefone"
                  ),
                  validator: (value) => (value.isEmpty) ? "Informe um Telefone" : null,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  _validateNome(String value){
    if(value.isEmpty){
      return "Informe um nome";
    }else if(value.length < 3){
      return "Informe um nome com no mínimo três caracteres";
    }else{
      return null;
    }
  }

  _floatingActionButton() {
    return FloatingActionButton(
      child: (widget.contato == null) ? Icon(Icons.save) : Icon(Icons.update),
      onPressed: _onClickSaveContato,
    );
  }

  _onClickSaveContato(){

    bool validacao = _formKey.currentState.validate();

    if(!validacao){
      return;
    }

    if(widget.contato == null) {
      _contatoDao.save(Contato(
          nome: edtNome.text, email: edtEmail.text, telefone: edtTelefone.text))
          .then((value) =>
      {
        Navigator.pop(context)
      });
    }else{
      _contatoDao.update(Contato(
          id:widget.contato.id, nome: edtNome.text, email: edtEmail.text, telefone: edtTelefone.text))
          .then((value) =>
      {
        Navigator.pop(context)
      });
    }
  }
}

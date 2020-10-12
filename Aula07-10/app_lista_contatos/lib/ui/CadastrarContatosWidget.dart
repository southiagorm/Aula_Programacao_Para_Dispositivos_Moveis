import 'package:applistacontatos/model/Contato.dart';
import 'package:applistacontatos/utils/ListaContatos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastrarContatosWidget extends StatefulWidget {
  @override
  _CadastrarContatosWidgetState createState() => _CadastrarContatosWidgetState();
}

class _CadastrarContatosWidgetState extends State<CadastrarContatosWidget> {

  TextEditingController edtNome = TextEditingController();
  TextEditingController edtEmail = TextEditingController();
  TextEditingController edtTelefone = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: (){
            Contato contato = Contato(edtNome.text, edtEmail.text, edtTelefone.text);
            _irParaTelaListarContatos(contato);
          },)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: edtNome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome"
              ),
            ),
            TextField(
              controller: edtEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email"
              ),
            ),
            TextField(
              controller: edtTelefone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: "Telefone"
              ),
            )
          ],
        ),
      ),
    );
  }

  void _irParaTelaListarContatos(Contato contato){
    Navigator.pop(context, contato);
  }

}

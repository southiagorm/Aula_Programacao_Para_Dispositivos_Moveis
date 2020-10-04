import 'package:applistacontatos/model/Contato.dart';
import 'package:applistacontatos/utils/ListaContatos.dart';
import 'package:flutter/material.dart';

class ListarContatosWidget extends StatefulWidget {
  @override
  _ListarContatosWidgetState createState() => _ListarContatosWidgetState();
}

class _ListarContatosWidgetState extends State<ListarContatosWidget> {

  @override
  void initState() {
    super.initState();
    ListaContatos.addContato(Contato("A", "a@email.com", "839995522"));
    ListaContatos.addContato(Contato("B", "b@email.com", "83985544"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){},
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: ListaContatos.getSize(),
        itemBuilder: (context, index){
            return _itemContato(context, index);
        },
      ),
    );
  }

  Widget _itemContato(BuildContext context, int indice){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(ListaContatos.listarContatos()[indice].nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Text(ListaContatos.listarContatos()[indice].email, style: TextStyle(fontSize: 16),),
          Text(ListaContatos.listarContatos()[indice].telefone, style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }
}

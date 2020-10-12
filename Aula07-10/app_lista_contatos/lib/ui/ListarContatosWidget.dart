import 'package:applistacontatos/model/Contato.dart';
import 'package:applistacontatos/ui/CadastrarContatosWidget.dart';
import 'package:applistacontatos/utils/ListaContatos.dart';
import 'package:flutter/material.dart';

class ListarContatosWidget extends StatefulWidget {
  @override
  _ListarContatosWidgetState createState() => _ListarContatosWidgetState();
}

class _ListarContatosWidgetState extends State<ListarContatosWidget> with WidgetsBindingObserver  {

  @override
  void initState() {
    super.initState();
    ListaContatos.addContato(Contato("A", "a@email.com", "839995522"));
    ListaContatos.addContato(Contato("B", "b@email.com", "83985544"));

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _irParaTelaCadastroContatos();
        },
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
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ListaContatos.listarContatos()[indice].nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Text(ListaContatos.listarContatos()[indice].email, style: TextStyle(fontSize: 16),),
              Text(ListaContatos.listarContatos()[indice].telefone, style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
      ),
      onTap: () => print("Clicou!"),
    );
  }

  void _irParaTelaCadastroContatos() async {
      Contato contato = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return CadastrarContatosWidget();
    }));

    print("Chegou!");
    if(contato != null){
      setState(() {
        ListaContatos.addContato(contato);
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        ListaContatos.getSize();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}

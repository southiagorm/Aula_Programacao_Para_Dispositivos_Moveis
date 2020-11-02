import 'package:flutter/material.dart';
import 'package:flutterlistatitulo/ui/cadastrar_titulo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> titulos = List<String>();

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
      title: Text("Lista Títulos"),
    );
  }

  _floatActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        _onClickIrParaTelaCadastrarTitulo();
      },
    );
  }

  _body() {
    return Container(
      child: ListView.builder(
          itemCount: titulos.length,
          itemBuilder: (context, index){
            return _itemList(context, index);
          }
      ),
    );
  }

  _itemList(context, index){
    return Card(
      shadowColor: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titulos[index])
        ],
      ),
    );
  }

  _onClickIrParaTelaCadastrarTitulo() async{
    String titulo = await Navigator.push(context, MaterialPageRoute(builder: (context) =>
      CadastrarTitulo()
    ));

    if(titulo.isNotEmpty){
      setState(() {
        titulos.add(titulo);
      });
    }
  }

}

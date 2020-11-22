import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappdatabase/database/contato_dao.dart';
import 'package:flutterappdatabase/model/Contato.dart';
import 'package:flutterappdatabase/ui/cadastrar_contato.dart';

class ListarContatos extends StatefulWidget {
  @override
  _ListarContatosState createState() => _ListarContatosState();
}

class _ListarContatosState extends State<ListarContatos> {

  ContatoDao _contatoDao = ContatoDao();
  List<Contato> _contatos = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatActionButton(context),
    );
  }

  _appBar() {
    return AppBar(
      title: Text("Listar Contatos"),
    );
  }

  _body() {
    return FutureBuilder<List<Contato>>(
        initialData: List(),
        future: ContatoDao().listarTodos(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Carregando")
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              _contatos = snapshot.data;
              return ListView.builder(
                  itemCount: _contatos.length,
                  itemBuilder: (context, index){
                    Contato contato = _contatos[index];
                    return _itemList(contato, index);
                  }
              );
              break;
          }

          return Text("Erro Desconhecido");
        }
    );
  }

  _floatActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        _onClickNextPageCadastrarContato(context);
      },
    );
  }

  _itemList(Contato contato, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(contato.nome, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(contato.telefone),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Text(contato.email),
              )
            ],
          ),
        ),
      ),
      onTap: (){
        _showBottomSheetOptions(index);
      },
    );
  }

  _showBottomSheetOptions(int index){
    return showModalBottomSheet(
        context: context,
        builder: (context){
          return BottomSheet(
            onClosing: (){},
            builder: (context){
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FlatButton(
                      child: Text("Alterar"),
                      onPressed: (){
                        _onClickNextPageAlterarContato(context, _contatos[index]);
                      },
                    ),
                    FlatButton(
                      child: Text("Deletar"),
                      onPressed: (){
                        _contatoDao.remover(_contatos[index].id).then((value) => {
                          Navigator.pop(context),
                          setState((){})
                        });
                      },
                    )
                  ],
                ),
              );
          },);
        });
  }

  void _onClickNextPageAlterarContato(BuildContext context, Contato contato) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CadastrarContato(contato: contato,);
    })).then((value) => {
      Navigator.pop(context),
      setState((){})
    });
  }

  void _onClickNextPageCadastrarContato(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CadastrarContato();
    })).then((value) => {
      setState((){})
    });
  }
}

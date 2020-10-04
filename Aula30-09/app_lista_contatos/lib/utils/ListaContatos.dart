import 'package:applistacontatos/model/Contato.dart';

class ListaContatos{

  static List<Contato> _contatos = List<Contato>();

  static void addContato(Contato contato){
    _contatos.add(contato);
  }

  static List<Contato> listarContatos(){
    return List.unmodifiable(_contatos);
  }

  static int getSize(){
    return _contatos.length;
  }

}
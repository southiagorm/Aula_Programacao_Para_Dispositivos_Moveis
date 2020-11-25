import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetoapirest/model/produto.dart';
import 'package:projetoapirest/model/response_message.dart';

class ApiProdutos{

  static var url = "http://10.0.2.2:8080/WebServicesProdutos/api/produtos/";
  static Map<String, String> headers = {
    "Content-Type" : "application/json"
  };

  static Future<ResponseMessage<Produto>> delete(int id) async{

    var response = await http.delete(url+id.toString(), headers: headers);

    if(response.statusCode == 204){
      return ResponseMessage.ok();
    }

    Map<String, dynamic> mapDecode = jsonDecode(response.body);
    return ResponseMessage.error(msg: mapDecode["message"]);

  }

  static Future<ResponseMessage<Produto>> update(Produto produto) async{

    String jsonBody = jsonEncode({"nome" : produto.nome, "qtde" : produto.qtde});

    var response = await http.put(url+produto.id.toString(), headers: headers, body: jsonBody);

    if(response.statusCode == 204){
      return ResponseMessage.ok();
    }

    Map<String, dynamic> mapDecode = jsonDecode(response.body);
    return ResponseMessage.error(msg: mapDecode["message"]);

  }

  static Future<ResponseMessage<Produto>> save(Produto produto) async{

    String jsonBody = jsonEncode({"nome" : produto.nome, "qtde" : produto.qtde});

    var response = await http.post(url, headers: headers, body: jsonBody);

    if(response.statusCode == 204){
      return ResponseMessage.ok();
    }

    Map<String, dynamic> mapDecode = jsonDecode(response.body);
    return ResponseMessage.error(msg: mapDecode["message"]);

  }

  static Future<ResponseMessage<Produto>> findById(int id) async{

    var response = await http.get(url+id.toString(), headers: headers);
    Map<String, dynamic> mapDecode = jsonDecode(response.body);

    if(response.statusCode == 200) {
      Produto p = Produto.fromJson(mapDecode);
      var resposta = ResponseMessage.ok(result: p);
      return resposta;
    }

    return ResponseMessage.error(msg: mapDecode["message"]);
  }
}
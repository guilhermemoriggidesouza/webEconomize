import 'package:flutter/foundation.dart';
import 'package:webEconomize/models/movSaida.dart';
import 'package:webEconomize/service/APIopa.dart';


class MovSaidaController with ChangeNotifier{
   List<Map<String, String>> listaInfosMovSaidaNaoConcluidas = [];
  List<Map<String, String>> listaInfosMovSaidaConcluidas = [];
  MovSaidaModel movSaidaCadastrar = MovSaidaModel();

  concluirMovSaida(int index){
    print(index);
  }

  removerMovSaida(int index){
    print(index);
  }

  Future<String> cadastrarMovSaida() async{
    if(movSaidaCadastrar.texto == null || movSaidaCadastrar.titulo == null) return "Preencha todas as informações";
    dynamic response = await ApiOpa.cadastrarMovSaida(movSaidaCadastrar);
    return response['msg'];
  }

}
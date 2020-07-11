import 'package:flutter/foundation.dart';
import 'package:webEconomize/models/metas.dart';
import 'package:webEconomize/service/APIopa.dart';

class MetasController with ChangeNotifier{
  List<Map<String, String>> listaInfosMetasNaoConcluidas = [];
  List<Map<String, String>> listaInfosMetasConcluidas = [];
  MetaModel metaCadastrar = MetaModel();

  concluirMeta(int index){
    print(index);
  }

  removerMeta(int index){
    print(index);
  }

  Future<String> cadastrarMetas() async{
    if(metaCadastrar.texto == null || metaCadastrar.titulo == null || metaCadastrar.valor == null) return "Preencha todas as informações";
    dynamic response = await ApiOpa.cadastrarMetas(metaCadastrar);
    return response['msg'];
  }

}
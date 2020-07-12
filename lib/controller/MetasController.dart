import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/Meta.dart';
import 'package:webEconomize/models/metas.dart';
import 'package:webEconomize/service/APIopa.dart';

class MetasController with ChangeNotifier{
  List<Meta> listaInfosMetasNaoConcluidas = [];
  List<Meta> listaInfosMetasConcluidas = [];
  List<Meta> listaMetas =[];
  MetaModel metaCadastrar = MetaModel();

  Future<String> concluirMeta(int idmeta, int idlogin) async{
    dynamic response = await ApiOpa.concluirMeta(idmeta);
    consultarMetas(idlogin);
    return response['msg'];
  }

    Future<String> removerMeta(int idmeta, int idlogin) async{
    dynamic response = await ApiOpa.removerMeta(idmeta);
    consultarMetas(idlogin);
    return response['msg'];
  }

  Future<String> cadastrarMetas() async{
    if(metaCadastrar.texto == null || metaCadastrar.titulo == null || metaCadastrar.valor == null) return "Preencha todas as informações";
    dynamic response = await ApiOpa.cadastrarMetas(metaCadastrar);
    consultarMetas(metaCadastrar.idlogin);
    metaCadastrar = MetaModel();
    return response['msg'];
  }

  consultarMetas(int idlogin) async{
    dynamic responseMetasByLogin = await ApiOpa.recuperarMetasByLogin(idlogin);
    listaMetas = [];
    listaInfosMetasNaoConcluidas = [];
    listaInfosMetasConcluidas = [];
    if(responseMetasByLogin["resp"].length > 0){
      responseMetasByLogin["resp"].forEach((element) {
        Meta metaRecuperada = MetaModel.fromMaptoDomain(element);
        if(metaRecuperada.status.trim().toLowerCase() == "p".toLowerCase()){
          listaInfosMetasNaoConcluidas.add(metaRecuperada);
        }else{
          listaInfosMetasConcluidas.add(metaRecuperada);
        }
      });
    }
    notifyListeners();
  }

}
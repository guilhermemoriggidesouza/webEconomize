import 'package:flutter/foundation.dart';
import 'package:webEconomize/models/movSaida.dart';
import 'package:webEconomize/service/APIopa.dart';
import 'package:webEconomize/domain/MovSaida.dart';


class MovSaidaController with ChangeNotifier{
  List<MovSaida> listaInfosMovSaidaNaoConcluidas = [];
  List<MovSaida> listaInfosMovSaidaConcluidas = [];
  List<MovSaida> listaMovSaida =[];
  MovSaidaModel movSaidaCadastrar = MovSaidaModel();

  concluirMovSaida(int index){
    print(index);
  }
    Future<String> removerMovSaida(int idmovSaida, int idsalario) async{
    dynamic response = await ApiOpa.removerMovSaida(idmovSaida);
    consultarMovSaida(idsalario);
    return response['msg'];
  }


  Future<String> cadastrarMovSaida() async{
    if(movSaidaCadastrar.texto == null || movSaidaCadastrar.titulo == null) return "Preencha todas as informações";
    dynamic response = await ApiOpa.cadastrarMovSaida(movSaidaCadastrar);
    consultarMovSaida(movSaidaCadastrar.idsalario);
    movSaidaCadastrar = MovSaidaModel();
    return response['msg'];
  }



   consultarMovSaida(int idsalario) async{
    dynamic responseMovSaidaByLogin = await ApiOpa.recuperarMovSaida(idsalario);
    listaMovSaida = [];
    listaInfosMovSaidaNaoConcluidas = [];
    listaInfosMovSaidaConcluidas = [];
    if(responseMovSaidaByLogin["resp"].length > 0){
      responseMovSaidaByLogin["resp"].forEach((element) {
        MovSaida movSaidaRecuperada = MovSaidaModel.fromMaptoDomain(element);
        if(movSaidaRecuperada.status.trim().toLowerCase() == "p".toLowerCase()){
          listaInfosMovSaidaNaoConcluidas.add(movSaidaRecuperada);
        }else{
          listaInfosMovSaidaConcluidas.add(movSaidaRecuperada);
        }
      });
    }
    notifyListeners();
  }

}
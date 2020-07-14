import 'package:flutter/foundation.dart';
import 'package:webEconomize/models/movSaida.dart';
import 'package:webEconomize/service/APIopa.dart';
import 'package:webEconomize/domain/MovSaida.dart';

class MovSaidaController with ChangeNotifier{
  List<MovSaida> listaInfosMovSaidaNaoConcluidas = [];
  List<MovSaida> listaInfosMovSaidaConcluidas = [];
  List<MovSaida> listaMovSaida =[];
  MovSaidaModel movSaidaCadastrar = MovSaidaModel();
  double valorMovSaidaConcluir = 0.0;

  Future<String> concluirMovSaida(int idmovSaida, int idsalario) async{
    dynamic response = await ApiOpa.concluirMovSaida(idmovSaida, valorMovSaidaConcluir);
    consultarMovSaida(idsalario);
    valorMovSaidaConcluir = 0.0;
    return response['msg'];
  }

  Future<String> removerMovSaida(int idmovSaida, int idsalario) async{
    dynamic response = await ApiOpa.removerMovSaida(idmovSaida);
    consultarMovSaida(idsalario);
    return response['msg'];
  }

  limparMovSaida(){
    listaInfosMovSaidaNaoConcluidas = [];
    listaInfosMovSaidaConcluidas = [];
    listaMovSaida = [];
  }

  Future<String> cadastrarMovSaida() async{
    if(movSaidaCadastrar.texto == null || movSaidaCadastrar.titulo == null) return "Preencha todas as informações";
    dynamic response = await ApiOpa.cadastrarMovSaida(movSaidaCadastrar);
    consultarMovSaida(movSaidaCadastrar.idsalario);
    movSaidaCadastrar = MovSaidaModel();
    return response['msg'];
  }

  consultarMovSaida(int idsalario) async{
    dynamic responseMovSaidaBySalario = await ApiOpa.recuperarMovSaida(idsalario);
    listaMovSaida = [];
    listaInfosMovSaidaNaoConcluidas = [];
    listaInfosMovSaidaConcluidas = [];
    if(responseMovSaidaBySalario != null && responseMovSaidaBySalario["resp"].length > 0){
      responseMovSaidaBySalario["resp"].forEach((element) {
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
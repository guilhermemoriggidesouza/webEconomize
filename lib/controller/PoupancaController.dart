import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/Poupanca.dart';
import 'package:webEconomize/models/poupanca.dart';
import 'package:webEconomize/service/APIopa.dart';

class PoupancaController with ChangeNotifier{
  double valorModificarMais = 0.0;
  double valorModificarMenos = 0.0;
  Poupanca poupanca = Poupanca();
  double poupancaGeral = 0.0;

  Future<String> modificarSalarioMais() async{
    if(poupanca.idsalario == 0 || poupanca.idsalario == null) return "Salario de poupanca não selecionado";
    dynamic response = await ApiOpa.modificarPoupancaDeSalario(valorModificarMais, poupanca.idsalario);
    recuperarPoupanca(poupanca.idsalario, poupanca.idlogin);
    valorModificarMais = 0.0;
    return response["msg"];
  }

  Future<String> modificarSalarioMenos() async{
    if(poupanca.idsalario == 0 || poupanca.idsalario == null) return "Salario de poupanca não selecionado";
    dynamic response = await ApiOpa.modificarPoupancaDeSalario(valorModificarMenos*-1, poupanca.idsalario);
    recuperarPoupanca(poupanca.idsalario, poupanca.idlogin);
    valorModificarMenos = 0.0;
    return response["msg"];
  }

  limparPoupanca(){
    poupanca = Poupanca();
    poupancaGeral = 0.0;
  }

  recuperarPoupanca(int idsalario, int idlogin) async{
    dynamic responsePoupancaBySalario = await ApiOpa.recuperarPoupancaBySalario(idsalario);
    if(responsePoupancaBySalario['resp'] !=  []){
      poupanca = PoupancaModel.fromMapToDomain(responsePoupancaBySalario['resp']);
    }
    await recuperarPoupancaByLogin(idlogin);
    notifyListeners();
  }

  recuperarPoupancaByLogin(int idlogin) async{
    dynamic responsePoupancaByLogin = await ApiOpa.recuperarPoupancaByLogin(idlogin);
    if(responsePoupancaByLogin["resp"] != []){
      poupancaGeral = 0.0;
      responsePoupancaByLogin["resp"].forEach((element){
        poupancaGeral += element['valor'];
      });
    }
  }
}
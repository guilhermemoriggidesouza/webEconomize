import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/Salario.dart';
import 'package:webEconomize/domain/salario_detalhe.dart';
import 'package:webEconomize/models/salario.dart';
import 'package:webEconomize/service/APIopa.dart';

class SalarioController with ChangeNotifier{
  List<SalarioDetalhe> listaSalarioDetalhe = List<SalarioDetalhe>();
  Salario salario = Salario();
  SalarioModel salarioCadastrar = SalarioModel();
  List<Salario> listaSalarios = List<Salario>();
  double valorModificar = 0.0;

  SalarioController(){
    this.listaSalarioDetalhe.add(SalarioDetalhe(1, "Movimentação de objetivo", 400.0, 1));
    this.listaSalarioDetalhe.add(SalarioDetalhe(2, "uma descricao ae", 200.0, 2));
    notifyListeners();
  }

  modificarSalario() async{
    dynamic response = await ApiOpa.modificarSalario(valorModificar, salario.idsalario);
    notifyListeners();
  }

  mudarSalarioAtual(newSalario){
    salario = newSalario;
    notifyListeners();
  }

  limparSalario(){
    listaSalarioDetalhe = List<SalarioDetalhe>();
    salario = Salario();
    listaSalarios = List<Salario>();
    notifyListeners();
  }

  removerSalario(Salario salarioParaRemover) async{
    dynamic retorno = await ApiOpa.removerSalario(salarioParaRemover.idsalario);
    if(retorno['resp'] == []) return retorno["msg"];
    if(salarioParaRemover.idsalario == salario.idsalario){
      salario = Salario();
    }
    recuperarSalarioUsuario(salarioParaRemover.idlogin);
    return retorno["msg"];
  }

  Future<String> cadastrarSalario() async{
    if(salarioCadastrar.salarioFixo == 0.0 || salarioCadastrar.salarioResto == "") return "Preencha todos os dados";
    dynamic retorno = await ApiOpa.cadastrarSalario(salarioCadastrar);
    if(retorno['resp'] != []){
      recuperarSalarioUsuario(salarioCadastrar.idlogin);
    }
    return retorno["msg"];
  }

  recuperarSalarioUsuario(int idlogin) async{
    dynamic retorno = await ApiOpa.recuperarSalarioUsuario(idlogin);
    if(retorno['resp'].length > 0 && retorno['resp'] != null){
      listaSalarios = [];
      retorno['resp'].forEach((element) {
        listaSalarios.add(SalarioModel.fromMaptoDomain(element));
        if(element["idsalario"] == salario.idsalario){
          salario = SalarioModel.fromMaptoDomain(element);
        }
      });
      notifyListeners();
    }
    return retorno['msg'];
  }

}
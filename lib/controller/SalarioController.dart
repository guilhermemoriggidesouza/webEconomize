import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/Salario.dart';
import 'package:webEconomize/domain/salario_detalhe.dart';
import 'package:webEconomize/models/salario.dart';
import 'package:webEconomize/models/salario_descricao.dart';
import 'package:webEconomize/service/APIopa.dart';

class SalarioController with ChangeNotifier{
  List<SalarioDetalhe> listaSalarioDetalhe = List<SalarioDetalhe>();
  Salario salario = Salario();
  SalarioModel salarioCadastrar = SalarioModel();
  List<Salario> listaSalarios = List<Salario>();
  double valorModificarMais = 0.0;
  double valorModificarMenos = 0.0;

  Future<String> modificarSalarioMais() async{
    dynamic response = await ApiOpa.modificarSalario(valorModificarMais, salario.idsalario);
    recuperarSalarioUsuario(salario.idlogin);
    valorModificarMais = 0.0;
    notifyListeners();
    return response["msg"];
  }

  Future<String> modificarSalarioMenos() async{
    dynamic response = await ApiOpa.modificarSalario(valorModificarMenos*-1, salario.idsalario);
    recuperarSalarioUsuario(salario.idlogin);
    valorModificarMenos = 0.0;
    notifyListeners();
    return response["msg"];
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
    listaSalarios = [];
    if(retorno['resp'].length > 0 && retorno['resp'] != null){
      retorno['resp'].forEach((element) {
        listaSalarios.add(SalarioModel.fromMaptoDomain(element));
        if(element["idsalario"] == salario.idsalario){
          salario = SalarioModel.fromMaptoDomain(element);
        }
      });
    }
    notifyListeners();
  }

  recuperarSalarioDescricao(int idsalario) async{
    dynamic retorno = await ApiOpa.recuperarSalarioDetalhe(idsalario);
    listaSalarioDetalhe = [];
    if(retorno['resp'].length > 0 && retorno['resp'] != null){
      retorno['resp'].forEach((element) {
        listaSalarioDetalhe.add(SalarioDetalheModel.fromMaptoDomain(element));
      });
    }
    notifyListeners();
  }

}
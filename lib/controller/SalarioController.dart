import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/Salario.dart';
import 'package:webEconomize/domain/salario_detalhe.dart';
import 'package:webEconomize/models/salarioModel.dart';
import 'package:webEconomize/service/APIopa.dart';

class SalarioController with ChangeNotifier{
  List<SalarioDetalhe> listaSalarioDetalhe = List<SalarioDetalhe>();
  Salario salario = Salario(idsalario: 0, dataCadastro: "04/07/2020", salarioFixo: 0.0, salarioResto: 0.0);
  SalarioModel salarioCadastrar = SalarioModel();
  List<Salario> listaSalarios = List<Salario>();
  String modificarSomarSalario = "0.0"; 
  String modificarSubtrairSalario = "0.0"; 

  SalarioController(){

    this.listaSalarioDetalhe.add(SalarioDetalhe(1, "Movimentação de objetivo", 400.0, 1));
    this.listaSalarioDetalhe.add(SalarioDetalhe(2, "uma descricao ae", 200.0, 2));

    this.listaSalarios.add(Salario(idsalario: 1, dataCadastro: "04/07/2020", salarioFixo: 100, salarioResto: 200));
    this.listaSalarios.add(Salario(idsalario: 2, dataCadastro: "04/07/2020", salarioFixo: 200, salarioResto: 200));

    notifyListeners();
  }

  adicionarSalario(){
    salario.salarioResto += double.parse(modificarSomarSalario);
    salario.salarioFixo += double.parse(modificarSomarSalario);
    notifyListeners();
  }

  mudarSalarioAtual(newSalario){
    salario = newSalario;
    notifyListeners();
  }

  diminuirSalario(){
    salario.salarioResto -= double.parse(modificarSubtrairSalario);
    salario.salarioFixo -= double.parse(modificarSubtrairSalario);
    notifyListeners();
  }

  removerSalario(salarioParaRemover){
    listaSalarios.remove(salarioParaRemover);
    notifyListeners();
    return "Salario removido com sucesso";
  }

  Future<String> cadastrarSalario() async{
    if(salarioCadastrar.salarioFixo == 0.0 || salarioCadastrar.salarioResto == "") return "Preencha todos os dados";
    dynamic retorno = await ApiOpa.cadastrarSalario(salarioCadastrar);
    return retorno["msg"];

  }

}
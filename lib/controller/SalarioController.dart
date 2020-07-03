import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/Salario.dart';
import 'package:webEconomize/domain/salario_detalhe.dart';

class SalarioController with ChangeNotifier{
  List<SalarioDetalhe> listaSalarioDetalhe = List<SalarioDetalhe>();
  Salario salario = Salario(idsalario: 0, dataCadastro: "04/07/2020", salarioFixo: 0.0, salarioResto: 0.0);
  List<Salario> listaSalarios = List<Salario>();
  String modificarSomarSalario = "0.0"; 
  String modificarSubtrairSalario = "0.0"; 

  SalarioController(){

    this.listaSalarioDetalhe.add(SalarioDetalhe(1, "Movimentação de objetivo", 400.0, 1));
    this.listaSalarioDetalhe.add(SalarioDetalhe(2, "uma descricao ae", 200.0, 2));

    this.listaSalarios.add(Salario(idsalario: 1, dataCadastro: "04/07/2020", salarioFixo: 100, salarioResto: 200));
    this.listaSalarios.add(Salario(idsalario: 2, dataCadastro: "04/07/2020", salarioFixo: 200, salarioResto: 200));
    this.listaSalarios.add(Salario(idsalario: 3, dataCadastro: "04/07/2020", salarioFixo: 400, salarioResto: 200));
    this.listaSalarios.add(Salario(idsalario: 4, dataCadastro: "04/07/2020", salarioFixo: 300, salarioResto: 200));
    this.listaSalarios.add(Salario(idsalario: 5, dataCadastro: "04/07/2020", salarioFixo: 500, salarioResto: 200));
    this.listaSalarios.add(Salario(idsalario: 6, dataCadastro: "04/07/2020", salarioFixo: 600, salarioResto: 200));
    this.listaSalarios.add(Salario(idsalario: 7, dataCadastro: "04/07/2020", salarioFixo: 700, salarioResto: 200));

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

}
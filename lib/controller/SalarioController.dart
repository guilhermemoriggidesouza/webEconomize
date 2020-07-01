import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/Salario.dart';
import 'package:webEconomize/domain/salario_detalhe.dart';

class SalarioController with ChangeNotifier{
  List<SalarioDetalhe> listaSalarioDetalhe = List<SalarioDetalhe>();
  Salario salario = Salario(dataCadastro: "04/07/2020", salarioFixo: 0.0, salarioResto: 0.0);
  String modificarSomarSalario = "0.0"; 
  String modificarSubtrairSalario = "0.0"; 

  SalarioController(){
    this.listaSalarioDetalhe.add(SalarioDetalhe(1, "Movimentação de objetivo", 400.0, 1));
    this.listaSalarioDetalhe.add(SalarioDetalhe(2, "uma descricao ae", 200.0, 2));
    notifyListeners();
  }

  adicionarSalario(){
    salario.salarioResto += double.parse(modificarSomarSalario);
    salario.salarioFixo += double.parse(modificarSomarSalario);
    notifyListeners();
  }

  diminuirSalario(){
    salario.salarioResto -= double.parse(modificarSubtrairSalario);
    salario.salarioFixo -= double.parse(modificarSubtrairSalario);
    notifyListeners();
  }

}
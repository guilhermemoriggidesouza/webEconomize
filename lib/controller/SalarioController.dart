import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/salario_detalhe.dart';
import 'package:webEconomize/view/salario.dart';

class SalarioController with ChangeNotifier{
  List<SalarioDetalhe> listaSalarioDetalhe = List<SalarioDetalhe>();
  String dataCadastro = "04/07/2020";
  double salarioResto = 1000.00;
  double salarioFixo = 500.00;
  String modificarSomarSalario = "0.0"; 

  SalarioController(){
    this.listaSalarioDetalhe.add(SalarioDetalhe(1, "Movimentação de objetivo", 400.0, 1));
    this.listaSalarioDetalhe.add(SalarioDetalhe(2, "uma descricao ae", 200.0, 2));
    notifyListeners();
  }

  addMaisUm(salario){
    this.listaSalarioDetalhe.add(salario);
    notifyListeners();
  }

}
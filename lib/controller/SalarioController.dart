import 'package:flutter/foundation.dart';
import 'package:webEconomize/domain/salario_detalhe.dart';
import 'package:webEconomize/view/salario.dart';

class SalarioController with ChangeNotifier{
  List<SalarioDetalhe> listaSalarioDetalhe = List<SalarioDetalhe>();

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
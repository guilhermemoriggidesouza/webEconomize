import 'package:webEconomize/domain/Salario.dart';

class SalarioModel{
  int idlogin;
  String dataCadastro;
  double salarioResto; 
  double salarioFixo;
  
  SalarioModel({
    this.idlogin,
    this.dataCadastro,
    this.salarioResto,
    this.salarioFixo
  });

  Map<String, dynamic> toMap() {
    return {
      'idlogin': idlogin,
      'valor_resto': salarioResto,
      'valor_fixo': salarioFixo,
    };
  }

  toModel(Salario salario){
    this.idlogin = salario.idlogin;
    this.dataCadastro = salario.dataCadastro;
    this.salarioResto = salario.salarioResto;
    this.salarioFixo = salario.salarioFixo;
  }

  static Salario fromMaptoDomain(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Salario(
      idsalario: map['idsalario'],
      idlogin: map['idlogin'],
      dataCadastro: map['valor_resto'].toString(),
      salarioResto: map['valor_resto'].toDouble(),
      salarioFixo: map['valor_fixo'].toDouble(),
    );
  }
}
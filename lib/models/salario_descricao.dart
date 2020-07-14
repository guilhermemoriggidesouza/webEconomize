
import 'package:webEconomize/domain/salario_detalhe.dart';

class SalarioDetalheModel{
  int idsalario_descricao;
  String descricao;
  double valor;
  int idsalario;

  SalarioDetalheModel({
    this.idsalario_descricao,
    this.descricao,
    this.valor,
    this.idsalario
  });
  
  Map<String, dynamic> toMap() {
    return {
      'idsalario_descricao': idsalario_descricao,
      'descricao': descricao,
      'valor': valor,
      'idsalario': idsalario,
    };
  }

  toModel(SalarioDetalhe salario){
    this.idsalario_descricao = salario.idsalario_descricao;
    this.descricao = salario.descricao;
    this.valor = salario.valor;
    this.idsalario = salario.idsalario;
  }

  static SalarioDetalhe fromMaptoDomain(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return SalarioDetalhe(
      idsalario_descricao: map['idsalario_descricao'],
      descricao: map['descricao'],
      valor: map['valor'].toDouble(),
      idsalario: map['idsalario'],
    );
  }
}
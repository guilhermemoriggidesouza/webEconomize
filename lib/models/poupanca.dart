import 'package:webEconomize/domain/Poupanca.dart';

class PoupancaModel{
  int idsalario;
  int idlogin;
  double valor;
  
  PoupancaModel({
    this.idsalario,
    this.idlogin,
    this.valor
  });

  Map<String, dynamic> toMap() {
    return {
      'idsalario': idsalario,
      'idlogin': idlogin,
      'valor': valor
    };
  }

  toModel(Poupanca poupanca){
    this.idsalario = poupanca.idsalario;
    this.idlogin = poupanca.idlogin;
    this.valor = poupanca.valor;
  }

  static Poupanca fromMapToDomain(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Poupanca(
      idsalario: map['idsalario'],
      idlogin: map['idlogin'],
      valor: double.parse(map['valor'].toString())
    );
  }
}
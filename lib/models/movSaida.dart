import 'package:webEconomize/domain/MovSaida.dart';

class MovSaidaModel{
  int idmov_saida;
  int idsalario;
  double valor;
  String titulo;
  String texto;
  String status;
 

  MovSaidaModel({
    this.idmov_saida,
    this.idsalario,
    this.valor,
    this.titulo,
    this.texto,
    this.status
  });

  Map<String, dynamic> toMap() {
    return {
      'idsalario': idsalario,
      'titulo': titulo,
      'texto': texto,
    };
  }

  toModel(MovSaida movSaida){
    this.idmov_saida = movSaida.idmov_saida;
    this.idsalario = movSaida.idsalario;
    this.valor = movSaida.valor;
    this.titulo = movSaida.titulo;
    this.texto = movSaida.texto;
    this.status = movSaida.status;
  }

  static MovSaida fromMaptoDomain(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return MovSaida(
      idmov_saida: map['idmov_saida'], 
      idsalario: map['idsalario'], 
      valor: map['valor'],
      titulo: map['titulo'],
      texto: map['texto'],
      status: map['status'],
    );
  }
}
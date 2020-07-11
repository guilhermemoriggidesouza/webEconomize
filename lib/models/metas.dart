import 'package:webEconomize/domain/Meta.dart';

class MetaModel {
  int idmeta;
  int idlogin;
  double valor;
  String titulo;
  String texto;
  String status;

  MetaModel({
    this.idlogin,
    this.valor,
    this.titulo,
    this.texto,
    this.status
  });

  Map<String, dynamic> toMap() {
    return {
      'idlogin': idlogin,
      'valor': valor,
      'titulo': titulo,
      'texto': texto,
    };
  }

  toModel(Meta meta){
    this.idmeta = meta.idmeta;
    this.idlogin = meta.idlogin;
    this.valor = meta.valor;
    this.titulo = meta.titulo;
    this.texto = meta.texto;
    this.status = meta.status;
  }

  static Meta fromMaptoDomain(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Meta(
      idmeta: map['idmeta'], 
      idlogin: map['idlogin'], 
      valor: map['valor'],
      titulo: map['titulo'],
      texto: map['texto'],
      status: map['status'],
    );
  }
}
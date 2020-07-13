import 'package:webEconomize/domain/interfacesCategorias/Imovimento.dart';

class Meta implements IMovimento{
  int idmeta;
  int idlogin;
  double valor;
  String titulo;
  String texto;
  String status;
  int idmovimento;

  Meta({
    this.idmeta,
    this.idlogin,
    this.valor,
    this.titulo,
    this.texto,
    this.status
  }){
    idmovimento = idmeta;
  }


}
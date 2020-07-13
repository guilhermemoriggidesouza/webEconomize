import 'package:webEconomize/domain/interfacesCategorias/Imovimento.dart';

class MovSaida implements IMovimento{
  int idmov_saida;
  int idsalario;
  double valor;
  String titulo;
  String texto;
  String status;
  @override
  int idmovimento;
 

  MovSaida({
    this.idmov_saida,
    this.idsalario,
    this.valor,
    this.titulo,
    this.texto,
    this.status
  }){
    idmovimento = idmov_saida;
  }
}
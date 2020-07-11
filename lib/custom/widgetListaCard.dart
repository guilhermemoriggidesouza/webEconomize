import 'package:flutter/material.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/view/metas.dart';

class WidgetListaCard extends StatelessWidget {
  bool mostrarBotaoConfirma;
  bool isMovTela;
  List<Map<String, String>> listaInfos = [];
  Function(int) onTapConfirma;
  Function(int) onTapExcluir;

  WidgetListaCard(this.listaInfos, this.isMovTela,{this.onTapConfirma, this.onTapExcluir, this.mostrarBotaoConfirma});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: listaInfos.length,
        itemBuilder: (context, index) {
        return Container(
          height: 250,
          child: Card(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 3.0, left: 5.0, right: 5.0),
                  child: Container(
                    child: Text(
                      listaInfos[index]["titulo"],
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40, bottom: 10),

                    child: Text(
                      listaInfos[index]["mensagem"],
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),
                    ),
                  ),
                ),
                _buildValorTelaMovSaida(isMovTela, context, listaInfos[index]["Valor"]),
                Container(
                  height: 48,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _buildBotao(true, "Confirmar",  Color(0xFF008ABE), context, onTapConfirma, index),
                      _buildBotao(false, "Excluir", Color(0xFFD4302b), context, onTapExcluir, index)
                    ],
                  ),
                ),
              ],
            ), 
          ),
        );
      }),
    );
    
  }

  _buildValorTelaMovSaida(bool isMovTela, BuildContext context, String valor){
    if(isMovTela){
      return Container(
        margin: EdgeInsets.only(right: 40, bottom: 3),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.end,
          children: <Widget>[
            Icon(
              Icons.monetization_on,
              color: Colors.white,
              size: 16,
            ),
            Text(
              valor,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
              ),
            ),
          ],
        ),
      );
    }else{
      return Container(
        margin: EdgeInsets.only(right: 40, bottom: 5),
      );
    }
  }

  _buildBotao(bool botaoExcluir, String text, Color color, context, Function onTapFunction, int index){
    double sizeWidth = 125;
    if(!mostrarBotaoConfirma && !botaoExcluir) return Container();
    if(!mostrarBotaoConfirma){ 
      text = "Excluir"; 
      color = Color(0xFFD4302b);
      sizeWidth = 235;
    }
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 12),
      width: sizeWidth,
      child: ButtonLabel(
        text,
        onTapFunction(index), 
        color: color, 
        textColor: Colors.white),
    );
  }
}
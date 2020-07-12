import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/PoupancaController.dart';
import 'package:webEconomize/custom/button.dart';
import 'package:webEconomize/domain/Meta.dart';

class WidgetListaSemButtons extends StatelessWidget {
  bool isMovTela;
  List<Meta> listaInfos = [];

  WidgetListaSemButtons(this.listaInfos, this.isMovTela);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listaInfos.length,
        itemBuilder: (context, index) {
        return Container(
          height: 500,
          child: Card(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 3.0, left: 5.0, right: 5.0),
                  child: Container(
                    child: Text(
                      listaInfos[index].titulo,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40, bottom: 10),

                    child: Text(
                      listaInfos[index].texto,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ),
                    ),
                  ),
                ),
                _buildValorTelaMovSaida(isMovTela, context, listaInfos[index].valor.toString()),
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
      return Container();
    }
  }
}
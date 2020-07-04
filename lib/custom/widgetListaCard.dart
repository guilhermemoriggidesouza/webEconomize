import 'package:flutter/material.dart';

class WidgetListaCard extends StatelessWidget {
  bool mostrarBotaoConfirma;
  List<String> mensagem = [];
  int isMovTela;

  WidgetListaCard(this.mensagem, this.isMovTela, {this.mostrarBotaoConfirma});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Container(
            width: double.infinity,
            child: Text(
              "Metas não concluidas",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 22,
              ),
            ),
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
          height: 277,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mensagem.length,
            itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Card(
                color: Colors.black.withOpacity(0.5),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 3.0, left: 5.0, right: 5.0),
                      child: Container(
                        child: Text(
                          "Titulo movimento da saida",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40, bottom: 10),
                        child: Text(
                          mensagem[index],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12
                          ),
                        ),
                      ),
                    ),
                    _buildValorTelaMovSaida(isMovTela, context),
                    Container(
                      child: Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.spaceBetween,
                        children: <Widget>[
                          _buildBotao(true, "Confirmar",  Color(0xff3cb371), context),
                          _buildBotao(false, "Excluir", Color(0xFFD4302b), context)
                        ],
                      ),
                    ),
                  ],
                ), 
              ),
            );
          }),
        ),
      ],
    );
  }

  _buildValorTelaMovSaida(int isMovTela, BuildContext context){
    double valor = 2000.0;
    if(isMovTela == 1){
      return Container(
        width: MediaQuery.of(context).size.width / 1,
        height: 19,
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
              "${valor}",
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
        width: MediaQuery.of(context).size.width / 1,
        height: 19,
        margin: EdgeInsets.only(right: 40, bottom: 5),
      );
    }
  }

  _buildBotao(bool botaoExcluir, String text, Color color, context ){
    num size = MediaQuery.of(context).size.width * 0.26;
    if(!mostrarBotaoConfirma && !botaoExcluir) return Container();
    if(!mostrarBotaoConfirma){ 
      text = "Excluir"; 
      size = MediaQuery.of(context).size.width; 
      color = Color(0xFFD4302b);
      }
    return Container(
      width:  size,
      child: RaisedButton(
        color: color,
        onPressed: (){},
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class WidgetListaCard extends StatelessWidget {
  bool mostrarBotaoConfirma;
  List<String> mensagem = [];

  WidgetListaCard(this.mensagem, {this.mostrarBotaoConfirma});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
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
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: 275,
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
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
                      child: Container(
                        child: Text(
                          "Titulo movimento da saida",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40, bottom: 20),
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
                    Container(
                      child: Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.spaceBetween,
                        children: <Widget>[
                          _buildBotao(true, "Confirmar",  Color(0xff3cb371), context),
                          _buildBotao(false, "Excluir", Color(0xffff2b36), context)
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

  _buildBotao(bool botaoExcluir, String text, Color color, context ){
    num size = MediaQuery.of(context).size.width * 0.26;
    if(!mostrarBotaoConfirma && !botaoExcluir) return Container();
    if(!mostrarBotaoConfirma){ 
      text = "Excluir"; 
      size = MediaQuery.of(context).size.width; 
      color = Color(0xffff2b36);
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
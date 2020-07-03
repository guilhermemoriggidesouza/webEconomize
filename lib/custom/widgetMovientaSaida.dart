import 'package:flutter/material.dart';

class WidgetMovimentaSaida extends StatelessWidget {

  List<String> mensagem = [];

  WidgetMovimentaSaida(List mensagem){
    this.mensagem = mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            width: double.infinity,
            child: Text(
              "Metas não concluida",
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
                          Container(
                            width:  MediaQuery.of(context).size.width * 0.26,
                            child: RaisedButton(
                              color: Color(0xff3cb371),
                              onPressed: (){},
                              child: Text(
                                "Confirmar",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            width:  MediaQuery.of(context).size.width * 0.26,
                            child: RaisedButton(
                              color: Color(0xffff2b36),
                              onPressed: (){},
                              child: Text(
                                "Excluir",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
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
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Metas extends StatefulWidget {
  @override
  _MetasState createState() => _MetasState();
}

class _MetasState extends State<Metas> {
  final List<String> mensagem = [
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
    "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
    "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
    "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
    "é simplesmente um texto fictício da indústria tipográfica e de impressão." +
    "Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff1B384A),
      body: _buildBody(),
    );
  }

  _buildBody() {
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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          height: 275,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mensagem.length,
            itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue)
              ),
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

  _buildList(){

  }
}

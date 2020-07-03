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
          height: MediaQuery.of(context).size.height * 0.35,
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
                        padding: const EdgeInsets.only(top: 20.0, left: 40, right: 40, bottom: 45),
                        child: Text(
                          mensagem[index],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13
                          ),
                        ),
                      ),
                    ),
                    Container( 
                      child: Padding(
                        padding: EdgeInsets.all(1),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: Container(
                                width: 115,
                                height: 45,
                                child: RaisedButton(
                                  elevation: 0,
                                  color: Colors.green,
                                  onPressed: () {},
                                  child: Text(
                                    "Confirmar",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 45,
                              width: 115,
                              child: RaisedButton(
                                elevation: 0,
                                color: Colors.red,
                                onPressed: () {},
                                child: Text(
                                  "Excluir",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
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

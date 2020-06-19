import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:webEconomize/controller/LoginController.dart';
import 'package:webEconomize/controller/sessions/SessionLogin.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

     return Scaffold(
        backgroundColor: Color(0xff1B384A),
      body: Padding(
              child: Column(
          children: <Widget>[
            SizedBox(height:20.0),
            ExpansionTile(
              title: Text(
                "Gastos",
                style: TextStyle(   
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Conclusão Objetivo',
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
                ListTile(
                  title: Text(
                    'Conclusão Objetivo',
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
                ListTile(
                  title: Text(
                    'Conclusão Objetivo',
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
                ListTile(
                  title: Text(
                    'Conclusão Objetivo',
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
                ListTile(
                  title: Text(
                    'Conclusão Objetivo',
                    style: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
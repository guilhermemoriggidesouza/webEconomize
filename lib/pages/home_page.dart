
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTitle('Futuro Menu'),
              _buildTitle('Dinheiro Guardado'),      
              _buildTitle('Gastos do Mês'),
              _buildTitle('...'),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar(){
    return AppBar(
      title: Text('Economize',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
      backgroundColor: Colors.black26,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.attach_money),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.info),
          onPressed: (){},
        )
      ],
    );
  }

  _buildTitle(String title, {double top = 16.0, double bottom = 8.0}){
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, top, 0.0, bottom),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
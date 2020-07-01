import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  String label = "";
  Icon icon;
  Color color;
  Function onTap;
  EdgeInsets margin;

  ButtonIcon(
    this.icon,
    this.onTap,
    {
      this.label,
      this.color,
      this.margin
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin != null ? margin : EdgeInsets.zero,
      color: color != null ? color : Colors.transparent,
      child: FlatButton(
        onPressed: onTap,
        child: Row( // Replace with a Row for horizontal icon + text   
          mainAxisAlignment: MainAxisAlignment.center,               
          children: <Widget>[
            icon,
            _buildTextButton()
          ],
        ),
      ),
    );
  }
  _buildTextButton(){
    if(label != null){
      return Container(
        padding: EdgeInsets.only(left: 10),
        child:  Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
        ),
      );
    }else{
      return Text("");
    }
  }
}
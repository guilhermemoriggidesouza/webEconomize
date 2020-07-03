import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  String label = "";
  Icon icon;
  Color color;
  Function onTap;
  EdgeInsets margin;
  EdgeInsets internalPadding;

  ButtonIcon(
    this.icon,
    this.onTap,
    {
      this.label,
      this.color,
      this.margin,
      this.internalPadding
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin != null ? margin : EdgeInsets.zero,
      height: 45,
      padding: EdgeInsets.zero,
      child: FlatButton(
        color: color != null ? color : Colors.transparent,
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3)
        ),
        padding: EdgeInsets.zero,
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
        padding: internalPadding == null ? EdgeInsets.only(left: 10) : internalPadding,
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
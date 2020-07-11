import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {

  double margin = 10;
  String hintText;
  Function(String) onTap;

  TextArea({
    Key key,
    this.margin,
    this.hintText,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(margin),
      child: Card(
        color: Color(0xff1B384A),
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: TextFormField(
            autocorrect: true,
            maxLines: 8,
            style: TextStyle(color: Colors.white, decorationColor: Colors.white),
            decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white
                ),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
              )
            ),
            onSaved: onTap
          ),
        )
      ),
    );
  }
}

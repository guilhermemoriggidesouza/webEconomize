import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {

  double margin = 10;
  String hintText;

  TextArea({
    Key key,
    this.margin,
    this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: 280,
        margin: EdgeInsets.all(margin),
        child: Card(
          color: Color(0xff1B384A),
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: TextField(
              autocorrect: true,
              maxLines: 8,
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
            ),
          )
        ),
      ),
    );
  }
}

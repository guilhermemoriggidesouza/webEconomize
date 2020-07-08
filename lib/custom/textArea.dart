import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {

  double width;

  TextArea({
    Key key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Card(
        color: Color(0xff1B384A),
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
              hintText: 'Descrição da meta',
              hintStyle: TextStyle(
                color: Colors.grey,
              )
            ),
          ),
        )
      ),
    );
  }
}

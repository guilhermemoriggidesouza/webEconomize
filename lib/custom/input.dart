import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  String label;
  Function(String) onSaved;
  bool obscureInput;


  InputLabel(
    this.label, 
    this.onSaved,{
      this.obscureInput
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white, decorationColor: Colors.white),
        obscureText: obscureInput == null ? false : obscureInput,
        keyboardType: TextInputType.text,
        onSaved: onSaved,
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,color: Colors.white),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,color: Colors.white)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1,color: Colors.white)
          ),
          hintText: label,
          hintStyle: TextStyle(fontSize: 18,color: Color(0xFFB3B1B1))
        ),
      ),
    );
  }
}
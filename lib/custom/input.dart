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
        obscureText: obscureInput == null ? false : obscureInput,
        keyboardType: TextInputType.text,
        onSaved: onSaved,
        maxLines: 1,
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
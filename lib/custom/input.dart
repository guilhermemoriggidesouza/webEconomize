import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  String label;
  Function(String) onSaved;

  InputLabel(
    this.label, 
    this.onSaved,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onSaved: onSaved,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: label,
          border: _roundedInputDecoration(),
        ),
      ),
    );
  }

  _roundedInputDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(45 * 0.1),
    );
  }
}
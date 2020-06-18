import 'package:flutter/material.dart';

class ButtonLabel extends StatelessWidget {
  String label;
  Function onTap;
  EdgeInsets padding;
  EdgeInsets internalPadding;

  ButtonLabel(
    this.label,
    this.padding,
    this.internalPadding,
    this.onTap
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(55 * 0.2),
            color: Colors.white,
          ),
          height: 55 * 0.8,
          padding: internalPadding,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
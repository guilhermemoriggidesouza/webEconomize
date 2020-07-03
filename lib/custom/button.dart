import 'package:flutter/material.dart';

class ButtonLabel extends StatelessWidget {
  String label;
  Function onTap;
  EdgeInsets padding;
  EdgeInsets internalPadding;
  Color color;
  Color textColor;
  double height;

  ButtonLabel(
    this.label,
    this.onTap,
    {
      this.padding,
      this.internalPadding,
      this.color,
      this.textColor,
      this.height
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null ? EdgeInsets.zero : padding,
      child: FlatButton(
        color: color == null ? Colors.white : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3)
        ),
        child: Container(
          height: height == null ? 50 : height,
          padding: internalPadding  == null ? EdgeInsets.zero : internalPadding,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: textColor == null ? Colors.black : textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
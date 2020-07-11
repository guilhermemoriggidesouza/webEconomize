import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webEconomize/custom/buttonIcon.dart';

class DialogCustom extends StatelessWidget implements Dialog {
  String label;
  Container body;

  DialogCustom(
    this.label,
    this.body
  );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff1B384A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Wrap(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(  
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          label,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )
                    ),
                    ButtonIcon(
                      Icon(FontAwesomeIcons.solidWindowClose, color: Colors.white, size: 24), (){
                      Navigator.pop(context, false);
                    })
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom:10),
                  child: body
                ), 
              ],
            ),
          ),
        ],
      )
    );
  }

  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => throw UnimplementedError();

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement clipBehavior
  Clip get clipBehavior => throw UnimplementedError();

  @override
  // TODO: implement elevation
  double get elevation => throw UnimplementedError();

  @override
  // TODO: implement insetAnimationCurve
  Curve get insetAnimationCurve => throw UnimplementedError();

  @override
  // TODO: implement insetAnimationDuration
  Duration get insetAnimationDuration => throw UnimplementedError();

  @override
  // TODO: implement insetPadding
  EdgeInsets get insetPadding => throw UnimplementedError();

  @override
  // TODO: implement shape
  ShapeBorder get shape => throw UnimplementedError();
}
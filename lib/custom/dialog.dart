import 'package:flutter/material.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                label,
                style: TextStyle(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: body
            ),
          ],
        ),
      ),
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
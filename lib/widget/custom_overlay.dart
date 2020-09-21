import 'package:flutter/material.dart';

class CustomOverlayWidget extends StatelessWidget {
  final Widget child;
  final bool active;
  CustomOverlayWidget({this.child, this.active});
  @override
  Widget build(BuildContext context) {
    if (!active) return child;
    return Stack(
      children: <Widget>[
        child,
        Container(color: Colors.transparent),
      ],
    );
  }
}
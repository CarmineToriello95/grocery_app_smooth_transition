import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider({Key key, this.bloc, Widget child})
      : super(key: key, child: child);

  final bloc;

  static BlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  }

  @override
  bool updateShouldNotify(BlocProvider oldWidget) {
    return true;
  }
}

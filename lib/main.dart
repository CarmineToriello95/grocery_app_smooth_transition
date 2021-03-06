import 'package:flutter/material.dart';
import 'package:grocery_app_smooth_transition/constants.dart';

import 'pages.dart/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: HomePage(),
    );
  }
}

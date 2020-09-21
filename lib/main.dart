import 'package:flutter/material.dart';
import 'package:grocery_app_smooth_transition/pages.dart/products_list_page.dart';

import 'bloc/bloc.dart';
import 'bloc/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: Bloc(),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(child: ProductsListPage()),
        ),
      ),
    );
  }
}

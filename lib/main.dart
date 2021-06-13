import 'package:flutter/material.dart';
import 'package:travelapp/detail_screen.dart';
import 'package:travelapp/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'B.co Fashion Store',
      theme: ThemeData(
        fontFamily: 'Bebas',
        primarySwatch: Colors.blueGrey,
      ),
      home: MainScreen(),
    );
  }
}



import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: TitleName(
              text: "Farm House Lembang",
            ),
          ),
          ActionBar(),
          DescriptionBox(description: "this is description")
        ],
      ),
    ));
  }
}

class TitleName extends StatelessWidget {
  final String text;
  TitleName({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    );
  }
}

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.calendar_today),
              Text("Open Today!"),
              SizedBox(
                height: 8.0,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.schedule),
              Text("09:00 - 17:00"),
              SizedBox(
                height: 8.0,
              )
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.monetization_on),
              Text("Rp. 25.000"),
              SizedBox(
                height: 8.0,
              )
            ],
          )
        ],
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  final String description;
  DescriptionBox({required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        description,
        style: TextStyle(color: Colors.black45,
        fontSize: 16.0),
      ),
    );
  }
}

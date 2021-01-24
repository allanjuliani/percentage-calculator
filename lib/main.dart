import 'package:flutter/material.dart';

import 'calc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //backgroundColor: Colors.red,
        primaryColor: Colors.blueAccent[200],
        //brightness: Brightness.light,
        //accentColor: Colors.green,
        //textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.blueAccent[200],
      ),
      home: CalcPage(),
    );
  }
}
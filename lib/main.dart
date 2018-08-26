import 'package:flutter/material.dart';
import 'pages/HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(theme: new ThemeData(primaryColor: Colors.white),
      routes: <String, WidgetBuilder>{

      },
      home: new HomePage(),
    );
  }
}

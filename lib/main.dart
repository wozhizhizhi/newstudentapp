import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'pages/TaskCenterPage.dart';
import 'pages/MedalWallPage.dart';
import 'pages/RedemptionCenterPage.dart';

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
        "/taskcenterpage": (BuildContext context) => new TaskCenterPage(),
      },
      home: new HomePage(),
    );
  }
}

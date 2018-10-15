import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'pages/TaskCenterPage.dart';
import 'pages/MedalWallPage.dart';
import 'pages/RedemptionCenterPage.dart';
import 'pages/ReadingVolumePage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'pages/VolumePage.dart';
import 'pages/ReadTimePage.dart';
import 'package:studentapp/pages/ReadWeekDayStarPage.dart';
import 'package:studentapp/pages/ReadFooterPage.dart';
import 'pages/LoginPage.dart';
import 'pages/HomePage.dart';

void main() {
  runApp(new MyApp());
  if (defaultTargetPlatform == TargetPlatform.android){
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TargetPlatform.iOS是确定的ios平台
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.white,
          platform: defaultTargetPlatform == TargetPlatform.iOS
              ? TargetPlatform.iOS
              : TargetPlatform.android),
      routes: <String, WidgetBuilder>{
        "/taskcenterpage": (BuildContext context) => new TaskCenterPage(),
        "/readingvolumepage": (BuildContext context) => new ReadingVolumePage(),
        "/volumepage": (BuildContext context) => new VolumePage(),
        "/readtimepage": (BuildContext context) => new ReadTimePage(),
        "/readweekdaystar": (BuildContext context) => new ReadWeekDayStarPage(),
        "/readfooterpage": (BuildContext context) => new ReadFooterPage(),
        "/loginpage": (BuildContext context) => new LoginPage(),
        "/homepage": (BuildContext context) => new HomePage(),
      },
      home: new LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';

class MedalWallPage extends StatefulWidget {
  @override
  _MedalWallPageState createState() => new _MedalWallPageState();
}

class _MedalWallPageState extends State<MedalWallPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/medalswall_img_bg.png"),
              fit: BoxFit.fill),
        ),
        child: new ListView(
          children: <Widget>[
            new Container(
              child: new Image.asset("images/task_btn_return.png"),
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 15.0, left: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}

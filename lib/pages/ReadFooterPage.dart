import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadFooterPage extends StatefulWidget {
  @override
  _ReadFooterPageState createState() => new _ReadFooterPageState();
}

class _ReadFooterPageState extends State<ReadFooterPage> {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
        child: new SingleChildScrollView(
            child: new Stack(
      children: <Widget>[
        new Image.asset(
          "images/readfooter1.png",
          fit: BoxFit.fill,
        ),
        new GestureDetector(child: new Container(
          child: new Image.asset(
            "images/btn_back_yellow.png",
            width: 27.0,
            height: 27.0,
          ),
          margin: const EdgeInsets.only(top: 30.0, left: 13.0),
        ),onTap: (){
          Navigator.pop(context);
        },),
      ],
    )));
  }
}

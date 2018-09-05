import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReadMessage extends StatefulWidget {
  @override
  _ReadMessageState createState() => _ReadMessageState();
}

class _ReadMessageState extends State<ReadMessage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              _buildTitle(),
            ],
          ),
        ),
      ),
    );

  }

  /// 标题的控件
  Widget _buildTitle()
  {
    return new Container(
      height: 175.0,
      width: 400.0,
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage(
                  "images/reading information_img_bg.png"),
              fit: BoxFit.fill)),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              child: new Image.asset(
                "images/btn_back_yellow.png",
                width: 25.0,
                height: 25.0,
              ),
              margin: const EdgeInsets.only(top: 35.0, left: 16.0),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

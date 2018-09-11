import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:studentapp/colors/StudentColors.dart';

class ReadMessage extends StatefulWidget {
  @override
  _ReadMessageState createState() => _ReadMessageState();
}

class _ReadMessageState extends State<ReadMessage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(color: StudentColors.s_f2f2f2,
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
  Widget _buildTitle() {
    return new Container(
      height: 175.0,
      width: 400.0,
      decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("images/reading information_img_bg.png"),
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
          new Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(
                      top: 6.0, bottom: 6.0, right: 10.0, left: 10.0),
                  width: 65.0,
                  height: 65.0,
                  child: new CircleAvatar(
                    backgroundImage:
                        AssetImage("images/defaul_head_parent.png"),
                  ),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(color: Colors.white, width: 2.0),
                  ),
                ),
                new Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(top: 8.0, left: 6.0),
                      child: new Row(
                        children: <Widget>[
                          new Text(
                            "李子龙",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          new Container(
                            child: new Image.asset(
                              "images/icon_lv3.png",
                              width: 22.0,
                              height: 9.0,
                            ),
                            margin: const EdgeInsets.only(left: 5.0, top: 7.0),
                          ),
                        ],
                      ),
                    ),
                    new Container(width: 258.0,margin: const EdgeInsets.only(top: 5.0,left: 6.0),
                      child: new Text(
                        "广州市越秀区东风东路小学（天伦校区）",
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        softWrap: true,
                      ),
                    ),

                    new Container(margin: const EdgeInsets.only(top: 5.0,left: 6.0),
                      child: new Text(
                        "二年级2班 ",
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        softWrap: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

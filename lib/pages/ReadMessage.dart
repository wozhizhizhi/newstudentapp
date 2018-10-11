import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:studentapp/colors/StudentColors.dart';
import 'package:studentapp/pages/MedalWallPage.dart';

class ReadMessage extends StatefulWidget {
  @override
  _ReadMessageState createState() => _ReadMessageState();
}

class _ReadMessageState extends State<ReadMessage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: StudentColors.s_f2f2f2,
        child: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              _buildTitle(),
              _buildItemone(),

              ///下划线
              new Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: new Divider(
                  color: StudentColors.s_e5e5e5,
                  height: 0.1,
                ),
              ),
              _buildItemtwo(),

              ///下划线
              new Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: new Divider(
                  color: StudentColors.s_e5e5e5,
                  height: 0.1,
                ),
              ),
              _buildItemthree(),

              ///下划线
              new Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: new Divider(
                  color: StudentColors.s_e5e5e5,
                  height: 0.1,
                ),
              ),

              _buildItemfour(),

              ///下划线
              new Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: new Divider(
                  color: StudentColors.s_e5e5e5,
                  height: 0.1,
                ),
              ),

              _buildItemfive(),
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
              image: new AssetImage("images/reading_information_img_bg.png"),
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
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    new Container(
                      width: 258.0,
                      margin: const EdgeInsets.only(top: 5.0, left: 6.0),
                      child: new Text(
                        "广州市越秀区东风东路小学（天伦校区）",
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        softWrap: true,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0, left: 6.0),
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

  /// 标题下面的的组件
  Widget _buildItemone() {
    return new Container(
      height: 67.0,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: new Text(
              "阅读成就",
              style: TextStyle(color: StudentColors.s_484848, fontSize: 15.0),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(right: 31.0, top: 21.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: 187.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Lv.3",
                        style: TextStyle(
                            color: StudentColors.s_484848, fontSize: 11.0),
                      ),
                      new Text(
                        "2300 / 3000",
                        style: TextStyle(
                            color: StudentColors.s_484848, fontSize: 11.0),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        width: 187.0,
                        height: 8.0,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(4.0),
                            color: StudentColors.s_e5e5e5),
                      ),
                      new Container(
                        width: 160.0,
                        height: 8.0,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(4.0),
                            color: StudentColors.s_fce705),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 勋章墙item组件
  Widget _buildItemtwo() {
    return new InkWell(child: new Container(
      height: 67.0,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: new Text(
              "勋章墙",
              style: TextStyle(color: StudentColors.s_484848, fontSize: 15.0),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(right: 31.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  "images/medalswall_icon_7days.png",
                  width: 35.0,
                  height: 35.0,
                ),
                new Image.asset(
                  "images/medalswall_icon_21days.png",
                  width: 35.0,
                  height: 35.0,
                ),
                new Image.asset(
                  "images/medalswall_icon_100days.png",
                  width: 35.0,
                  height: 35.0,
                ),
                new Image.asset(
                  "images/medalswall_icon_fan.png",
                  width: 35.0,
                  height: 35.0,
                ),
              ],
            ),
          ),
        ],
      ),
    ),onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
          return new MedalWallPage();
        }));
    },);
  }

  /// 阅读足迹的item组件
  Widget _buildItemthree() {
    return new InkWell(child: new Container(
      height: 67.0,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: new Text(
              "阅读足迹",
              style: TextStyle(color: StudentColors.s_484848, fontSize: 15.0),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(right: 15.0),
            child: new Row(
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new RichText(
                      text: new TextSpan(
                          text: "60",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: StudentColors.s_484848,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            new TextSpan(
                              text: "分钟",
                              style: TextStyle(
                                fontSize: 11.0,
                                color: StudentColors.s_484848,
                              ),
                            ),
                          ]),
                    ),
                    new Text(
                      "累积阅读",
                      style: TextStyle(
                          color: StudentColors.s_484848, fontSize: 11.0),
                    ),
                  ],
                ),
                new Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new RichText(
                        text: new TextSpan(
                            text: "3",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: StudentColors.s_484848,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              new TextSpan(
                                text: "千字",
                                style: TextStyle(
                                  fontSize: 11.0,
                                  color: StudentColors.s_484848,
                                ),
                              ),
                            ]),
                      ),
                      new Text(
                        "累积字数",
                        style: TextStyle(
                            color: StudentColors.s_484848, fontSize: 11.0),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new RichText(
                        text: new TextSpan(
                            text: "16",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: StudentColors.s_484848,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              new TextSpan(
                                text: "篇",
                                style: TextStyle(
                                  fontSize: 11.0,
                                  color: StudentColors.s_484848,
                                ),
                              ),
                            ]),
                      ),
                      new Text(
                        "创作随笔",
                        style: TextStyle(
                            color: StudentColors.s_484848, fontSize: 11.0),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: new Image.asset(
                    "images/homepage_btn_arrow_L.png",
                    width: 14.0,
                    height: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),onTap: (){
        Navigator.pushNamed(context, "/readfooterpage");
    },);
  }

  /// 积分兑换的item组件
  Widget _buildItemfour() {
    return new Container(
      height: 67.0,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: new Text(
              "积分兑换",
              style: TextStyle(color: StudentColors.s_484848, fontSize: 15.0),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(right: 15.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: new RichText(
                    text: new TextSpan(
                        children: <TextSpan>[
                          new TextSpan(
                            text: "6000",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: StudentColors.s_484848,
                                fontWeight: FontWeight.bold),
                          ),
                          new TextSpan(
                            text: " 积分",
                            style: TextStyle(
                                fontSize: 11.0,
                                color: StudentColors.s_484848,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: new Image.asset(
                    "images/homepage_btn_arrow_L.png",
                    width: 14.0,
                    height: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 积分兑换任务的item组件
  Widget _buildItemfive() {
    return InkWell(child: new Container(
      height: 67.0,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: new Text(
              "任务奖励",
              style: TextStyle(color: StudentColors.s_484848, fontSize: 15.0),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(right: 15.0),
            child: new Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: new RichText(
                    text: new TextSpan(children: <TextSpan>[
                      new TextSpan(
                        text: "3",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: StudentColors.s_484848,
                            fontWeight: FontWeight.bold),
                      ),
                      new TextSpan(
                        text: " 个 待领取",
                        style: TextStyle(
                            fontSize: 11.0,
                            color: StudentColors.s_484848,
                            fontWeight: FontWeight.w500),
                      ),
                    ]),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: new Image.asset(
                    "images/homepage_btn_arrow_L.png",
                    width: 14.0,
                    height: 14.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),onTap: (){
      Navigator.pushNamed(context, "/taskcenterpage");
    },);
  }
}

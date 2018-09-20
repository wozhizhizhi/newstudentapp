import 'package:flutter/material.dart';
import 'dart:async';
import 'package:studentapp/util/ScreenUtil.dart';
import 'package:studentapp/colors/StudentColors.dart';

/**
 * 每周阅读之星
 */
class ReadWeekDayStarPage extends StatefulWidget {
  @override
  _ReadWeekDayStarPageState createState() => new _ReadWeekDayStarPageState();
}

class _ReadWeekDayStarPageState extends State<ReadWeekDayStarPage> {
  double opacityLevel = 0.0;
  double sysStatsHeight = 0.0;
  ScrollController _scrollController;
  Color bgColor= Colors.transparent;
  Color titleColor = Colors.white;
  String _backurl = "images/task_btn_return.png";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = new ScrollController()
      ..addListener(() {
        if (_scrollController.position.pixels == 0.0) {
          bgColor = Colors.transparent;
          titleColor =  Colors.white;
          setState(() {
            _backurl = "images/task_btn_return.png";
          });
        } else if (_scrollController.position.pixels <= 48.0) {
          bgColor = Colors.white54;
          titleColor =  StudentColors.s_484848;
          setState(() {
            _backurl = "images/task_btn_return.png";
          });
        } else {
          bgColor = Colors.white;
          titleColor =  StudentColors.s_484848;
          setState(() {
            _backurl = "images/btn_back_yellow.png";
          });
        }
      });
  }

  Future<double> getSysStatsHeight() async {
    double statsHeight = await ScreenUtil.getSysStatsHeight(context);
    setState(() {
      sysStatsHeight = statsHeight;
    });
    return sysStatsHeight;
  }

  @override
  Widget build(BuildContext context) {
    getSysStatsHeight();
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new ListView.builder(
            padding: const EdgeInsets.only(top: 0.0),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildHead();
              }
              return _buildItemView(index);
            },
            itemCount: 10 * 2 + 1,
            controller: _scrollController,
          ),
          _buildTitle(),
        ],
      ),
    );
  }

  /// 标题
  Widget _buildTitle() {
    return new Container(
      height: sysStatsHeight + 48.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new InkWell(child: new Container(
            margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 24.0),
            child: new Image.asset(
              _backurl,
              width: 27.0,
              height: 27.0,
            ),),
          onTap: (){
            Navigator.pop(context);
          },),
          new Container(
            margin: const EdgeInsets.only(top: 24.0),
            child: new Text(
              "每周阅读之星",
              style: TextStyle(color: titleColor, fontSize: 18.0),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(right: 12.0, top: 24.0),
            child: new Text(
              "规则",
              style: TextStyle(color: titleColor, fontSize: 15.0),
            ),
          ),
        ],
      ),
      color: bgColor,
    );
  }

  /// Listview的头部
  Widget _buildHead() {
    return new Container(
      width: 375.0,
      child: new Column(
        children: <Widget>[
          new Container(
            width: 375.0,
            height: 198.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(
                    "images/wall_img_top.png",
                  ),
                  fit: BoxFit.fill),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: 52.0,
                        height: 52.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              new Border.all(color: Colors.white, width: 2.0),
                        ),
                        child: new CircleAvatar(
                          backgroundImage:
                              AssetImage("images/defaul_head_parent.png"),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: new Text(
                          "吴舒舒",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                      new Text(
                        "阅读之星",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: 52.0,
                        height: 52.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              new Border.all(color: Colors.white, width: 2.0),
                        ),
                        child: new CircleAvatar(
                          backgroundImage:
                              AssetImage("images/defaul_head_parent.png"),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: new Text(
                          "李子璇",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                      new Text(
                        "阅读积极分子",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: 52.0,
                        height: 52.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              new Border.all(color: Colors.white, width: 2.0),
                        ),
                        child: new CircleAvatar(
                          backgroundImage:
                              AssetImage("images/defaul_head_parent.png"),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: new Text(
                          "黄小星",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                      new Text(
                        "阅读小达人",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: new Text(
              "书虫榜",
              style: TextStyle(color: StudentColors.s_484848, fontSize: 17.0),
            ),
            height: 50.0,
            margin: const EdgeInsets.only(
              left: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  /// listview的子项
  Widget _buildItemView(int index) {
    /// 添加分割线
    if (index.isOdd) {
      return new Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: new Divider(
          color: StudentColors.s_e5e5e5,
          height: 0.3,
        ),
      );
    }
    final pos = index ~/ 2;
    return new Container(
      height: 60.0,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: new Image.asset(
                  "images/rank_icon_medal_gold.png",
                  width: 20.0,
                  height: 20.0,
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 6.0),
                child: new CircleAvatar(
                  backgroundImage: new AssetImage(
                    "images/defaul_head_parent.png",
                  ),
                ),
                width: 40.0,
                height: 40.0,
              ),
              new Container(
                margin: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: new Text(
                  "吴舒舒",
                  style:
                      TextStyle(fontSize: 15.0, color: StudentColors.s_484848),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(
                  left: 14.0,
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Image.asset(
                          "images/wall_icon_counts_word.png",
                          width: 10.0,
                          height: 10.0,
                        ),
                        new Text(
                          "2万字",
                          style: TextStyle(
                              color: StudentColors.s_999999, fontSize: 11.0),
                        )
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Image.asset(
                          "images/wall_icon_time.png",
                          width: 10.0,
                          height: 10.0,
                        ),
                        new Text(
                          "10小时",
                          style: TextStyle(
                              color: StudentColors.s_999999, fontSize: 11.0),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          new Container(
            margin: const EdgeInsets.only(
              right: 10.0,
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RichText(
                  text: new TextSpan(
                    children: <TextSpan>[
                      new TextSpan(
                        text: "7",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: StudentColors.s_22b2e1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new TextSpan(
                        text: "天",
                        style: TextStyle(
                          fontSize: 11.0,
                          color: StudentColors.s_22b2e1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                new Text(
                  "坚持阅读",
                  style:
                      TextStyle(color: StudentColors.s_9a9a9a, fontSize: 11.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

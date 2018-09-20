import 'package:flutter/material.dart';
import 'package:studentapp/colors/StudentColors.dart';

class ReadTimePage extends StatefulWidget {
  @override
  _ReadTimePageState createState() => new _ReadTimePageState();
}

class _ReadTimePageState extends State<ReadTimePage> with AutomaticKeepAliveClientMixin {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildTitle();
          }
          return _buildItemView(index);

        },
        itemCount: 10*2+1
      ),
    );
  }

  /// 标题
  Widget _buildTitle() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            height: 197.0,
            width: 375.0,
            decoration: new BoxDecoration(
                image: DecorationImage(
                    image: new AssetImage("images/rank_bg_top_times.png"),fit: BoxFit.fill
                ),
                color: Colors.white),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(top: 60.0),
                  width: 52.0,
                  height: 52.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: new CircleAvatar(
                    backgroundImage:
                    AssetImage("images/defaul_head_parent.png"),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    "陈明明",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                new Container(
                  child: new Text(
                    "第10名  |  累计字数  7千字",
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: 375.0,
            height: 50.0,
            child: new Text(
              "本周排名",
              style: TextStyle(fontSize: 16.0, color: StudentColors.s_484848),
            ),
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 12.0),
          )
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
            ],
          ),
          new Container(
            margin: const EdgeInsets.only(
              right: 10.0,
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RichText(
                  text: new TextSpan(
                    children: <TextSpan>[
                      new TextSpan(
                        text: "2",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: StudentColors.s_22b2e1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new TextSpan(
                        text: "万字",
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
                  "累计字数",
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

  @override
  bool get wantKeepAlive => true;

}

import 'package:flutter/material.dart';
import 'package:studentapp/colors/StudentColors.dart';
import 'dart:async';
import 'package:flutter/services.dart';

/**
 * 任务中心
 */
class TaskCenterPage extends StatefulWidget {
  @override
  _TaskCenterPagePageState createState() => new _TaskCenterPagePageState();
}

class _TaskCenterPagePageState extends State<TaskCenterPage> {
  double _learnOpacity = 1.0;
  PageController _pageController;
  ScrollController _scrollController;
  int _curIndex = 0;
  List<String> titles = ["日常任务", "特殊任务"];

  // 对于真机设置状态栏透明
//  static SystemUiOverlayStyle uiStyle = const SystemUiOverlayStyle(
//    systemNavigationBarColor: const Color(0x00000000),
//    systemNavigationBarDividerColor: null,
//    statusBarColor: const Color(0x00000000),
//    systemNavigationBarIconBrightness: Brightness.dark,
//    statusBarIconBrightness: Brightness.dark,
//    statusBarBrightness: Brightness.dark,
//  );
//
//  static appUIStyle() {
//    SystemChrome.setSystemUIOverlayStyle(uiStyle);
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(initialPage: _curIndex);
    _scrollController = new ScrollController();
//    appUIStyle();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("images/task_bg.png"), fit: BoxFit.fill),
        ),
        child: new Column(
          children: <Widget>[
            _buildTitle(),
            _buildUser(),
            _buildTaskwidget(),
          ],
        ),
      ),
    );
  }

  /// 调用插件的删除
//  Future<void> close() async {
//    // Platform messages may fail, so we use a try/catch PlatformException.
//    try {
//      await FlutterCloseactivityPlugin.activityClose;
//    } on PlatformException {
//      print("调用失败");
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//  }

  /// 标题
  Widget _buildTitle() {
    return new Container(
      margin: const EdgeInsets.only(top: 29.0, left: 15.0, right: 15.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new InkWell(
              child: new Container(
                child: new Image.asset(
                  "images/task_btn_return.png",
                  width: 27.0,
                  height: 27.0,
                ),
              ),
              onTap: () {
//                close();
              Navigator.of(context).pop();
  }),
          new Container(
            margin: const EdgeInsets.only(left: 110.0),
            child: new Text(
              "任务中心",
              style: new TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  /// 当前用户的信息组件
  Widget _buildUser() {
    return new Stack(
      children: <Widget>[
        new Opacity(
          opacity: 0.4,
          child: new Container(
            height: 52.0,
            margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 45.0),
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(22.0),
                color: Colors.white),
          ),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 21.0, left: 30.0),
          width: 60.0,
          height: 60.0,
          decoration: new BoxDecoration(
              border: new Border.all(width: 2.0, color: Colors.white),
              shape: BoxShape.circle),
          child: new CircleAvatar(
            backgroundImage: new AssetImage(
              "images/defaul_head_parent.png",
            ),
          ),
        ),
        new Padding(
          padding: const EdgeInsets.only(top: 51.0, left: 103.0),
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Text(
                    "陈明明",
                    style: new TextStyle(
                        fontSize: 18.0, color: StudentColors.s_484848),
                  ),
                  new Container(
                    child: new Image.asset(
                      "images/icon_lv3.png",
                      width: 29.0,
                      height: 11.0,
                    ),
                    margin: const EdgeInsets.only(left: 5.0, top: 5.0),
                  )
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Image.asset(
                      "images/icon_integration.png",
                      width: 16.0,
                      height: 16.0,
                    ),
                    new Container(
                      child: new Text(
                        "3000",
                        style: new TextStyle(
                            color: StudentColors.s_484848, fontSize: 12.0),
                      ),
                      margin: const EdgeInsets.only(left: 4.0),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(left: 14.0),
                      child: new Stack(
                        children: <Widget>[
                          new Container(
                            width: 120.0,
                            height: 8.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(4.0),
                                color: StudentColors.s_e5e5e5),
                          ),
                          new Container(
                            width: 80.0,
                            height: 8.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(4.0),
                                color: StudentColors.s_fce705),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      child: new Text(
                        "2000/3000",
                        style: new TextStyle(
                            fontSize: 9.0, color: StudentColors.s_484848),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  /// 日常任务特殊任务组件
  Widget _buildTaskwidget() {
    return new Flexible(
      child: new Container(
        width: 351.0,
        height: 450.0,
        margin: const EdgeInsets.only(top: 19.0, left: 12.0, right: 12.0),
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0), color: Colors.white),
        child: new Column(
          children: <Widget>[
            new Container(
              width: 196.0,
              height: 32.0,
              alignment: Alignment.center,
              color: Colors.white,
              margin: const EdgeInsets.only(top: 17.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new InkWell(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          titles[0],
                          style: new TextStyle(
                              fontSize: 17.0, color: StudentColors.s_22b2e1),
                        ),
                        new Opacity(
                          opacity: _setOpacity(0),
                          child: new Container(
                            width: 50.0,
                            height: 3.0,
                            decoration: new BoxDecoration(
                                color: StudentColors.s_22b2e1,
                                borderRadius: new BorderRadius.circular(2.0)),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {});
                      _curIndex = 0;
                      _pageController.animateToPage(_curIndex,
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                    },
                  ),
                  new InkWell(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          titles[1],
                          style: new TextStyle(
                              fontSize: 17.0, color: StudentColors.s_22b2e1),
                        ),
                        new Opacity(
                          opacity: _setOpacity(1),
                          child: new Container(
                            width: 50.0,
                            height: 3.0,
                            decoration: new BoxDecoration(
                                color: StudentColors.s_22b2e1,
                                borderRadius: new BorderRadius.circular(2.0)),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      setState(() {});
                      _curIndex = 1;
                      _pageController.animateToPage(_curIndex,
                          duration: new Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                    },
                  ),
                ],
              ),
            ),
            new Container(
              child: new Divider(
                height: 0.3,
                color: StudentColors.s_e5e5e5,
              ),
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            new Expanded(
              child: new PageView.builder(
                controller: _pageController,
                onPageChanged: pageChanged,
                itemCount: titles.length,
                itemBuilder: (BuildContext context, int index) {
                  return _bulidListWidget(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// tab下面的listview
  Widget _bulidListWidget(BuildContext context, int index) {
    return new ListView.builder(
        padding: const EdgeInsets.only(top: 0.0),
        itemCount: 10*2,
        itemBuilder: (BuildContext context, int index) {
          return _buildListItem(index);
        });
  }

  /// Listview 的item
  Widget _buildListItem(int index) {
    /// 添加分割线
    if (index.isOdd) {
      return new Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Divider(
          color: StudentColors.s_e5e5e5,
          height: 0.3,
        ),
      );
    }
    final pos = index ~/ 2;
    return new Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(top: 25.0),
            child: new Row(
              children: <Widget>[
                new Image.asset(
                  "images/task_icon_reading.png",
                  width: 13.0,
                  height: 16.0,
                ),
                new Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: new Text(
                    "每日阅读",
                    style: new TextStyle(
                        fontSize: 15.0, color: StudentColors.s_484848),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(
                    left: 5.0,
                  ),
                  child: new Text(
                    "阅读30分钟并打卡",
                    style: new TextStyle(
                        fontSize: 12.0, color: StudentColors.s_484848),
                  ),
                ),
                new Flexible(
                  child: new Container(
                    margin: const EdgeInsets.only(left: 41.0),
                    child: new Text(
                      "进度  40 /100",
                      style: new TextStyle(
                          color: StudentColors.s_9a9a9a, fontSize: 10.0),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 13.0, left: 26.0, bottom: 15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "+30积分",
                  style: new TextStyle(
                      color: StudentColors.s_9a9a9a, fontSize: 12.0),
                ),
                new Container(
                  margin: const EdgeInsets.only(right: 100.0),
                  child: new Text(
                    "+30战斗力",
                    style: new TextStyle(
                        color: StudentColors.s_9a9a9a, fontSize: 12.0),
                  ),
                ),
                new Container(
                  width: 69.0,
                  height: 24.0,
                  child: new FlatButton(
                    onPressed: null,
                    child: new Text(
                      "领取",
                      style: new TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    shape: new StadiumBorder(),
                    disabledColor: StudentColors.s_22b2e1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// PageView中onPageChanged代表页面改变的时候
  pageChanged(int index) {
    _curIndex = index;
    setState(() {});
  }

  /// title项下滑线透明度的改变
  double _setOpacity(int index) {
    if (index == _curIndex) {
      _learnOpacity = 1.0;
    } else {
      _learnOpacity = 0.0;
    }
    return _learnOpacity;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }
}

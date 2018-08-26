import 'package:flutter/material.dart';
import 'package:studentapp/colors/StudentColors.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:banner_view/banner_view.dart';

class ReadPage extends StatefulWidget {
  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  String url = "";
  final _chartSize = const Size(115.0, 115.0);
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// 阅读的图形圆圈
  Widget _buildCircularChart() {
    return new AnimatedCircularChart(
      duration: new Duration(milliseconds: 3000),
      key: _chartKey,
      size: _chartSize,
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              80.0,
              Color(0xffa886f3),
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              20.0,
              Color(0xff4a7bbb),
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      edgeStyle: SegmentEdgeStyle.round,
      percentageValues: true,
//      holeLabel: "今日阅读\n\r\r25分钟",
//      labelStyle: new TextStyle(color: Colors.white,fontSize: 12.0),
    );
  }

  /// 阅读量时长和天数控件
  Widget _buildLineWidget() {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage(
              "images/homepage_bg_list.png",
            ),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      margin: const EdgeInsets.only(top: 43.0),
      height: 80.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "累计阅读量",
                style: new TextStyle(
                    fontSize: 12.0, color: StudentColors.s_484848),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "7",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: StudentColors.s_484848,
                          fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      "千字",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: StudentColors.s_484848,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "累计时长",
                style: new TextStyle(
                    fontSize: 12.0, color: StudentColors.s_484848),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "120",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: StudentColors.s_484848,
                          fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      "分钟",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: StudentColors.s_484848,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "阅读天数",
                style: new TextStyle(
                    fontSize: 12.0, color: StudentColors.s_484848),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      "2",
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: StudentColors.s_484848,
                          fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      "天",
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: StudentColors.s_484848,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 星期的控价
  var timeWidget = new LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minWidth: viewportConstraints.maxWidth,
          ),
          child: new IntrinsicWidth(
            child: new Row(
              children: <Widget>[
                new Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: StudentColors.s_f6f6f6,
                    ),
                    width: 39.0,
                    height: 39.0,
                    child: new Text("10"),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 13.0)),
                new Container(
                  child: new Image.asset(
                    "images/homepage_icon_pass.png",
                    width: 39.0,
                    height: 39.0,
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 13.0, left: 13.0),
                ),
                new Container(
                  child: new Image.asset(
                    "images/homepage_icon_pass.png",
                    width: 39.0,
                    height: 39.0,
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 13.0, left: 13.0),
                ),
                new Container(
                  child: new Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "images/homepage_icon_today.png",
                        width: 39.0,
                        height: 39.0,
                      ),
                      new Text(
                        "四",
                        style: new TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 13.0, left: 13.0),
                ),
                new Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: StudentColors.s_f6f6f6,
                    ),
                    width: 39.0,
                    height: 39.0,
                    child: new Text("五"),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 13.0, left: 13.0)),
                new Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: StudentColors.s_f6f6f6,
                    ),
                    width: 39.0,
                    height: 39.0,
                    child: new Text("六"),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 13.0, left: 13.0)),
                new Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: StudentColors.s_f6f6f6,
                    ),
                    width: 39.0,
                    height: 39.0,
                    child: new Text("日"),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 13.0, left: 13.0)),
              ],
            ),
          ),
        ),
      );
    },
  );

  /** 阅读墙的组件 */
  Widget classWall() {
    return new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 11.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              "班级阅读墙",
              style:
                  new TextStyle(color: StudentColors.s_666666, fontSize: 14.0),
            ),
            padding: const EdgeInsets.only(top: 14.0, left: 15.0),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "阅读量",
                          style: new TextStyle(
                              fontSize: 12.0, color: StudentColors.s_484848),
                        ),
                        new Padding(
                          child: Image.asset(
                            "images/homepage_btn_arrow_ese.png",
                            width: 7.0,
                            height: 12.0,
                          ),
                          padding: const EdgeInsets.only(left: 2.5),
                        ),
                      ],
                    ),
                    new RichText(
                      text: new TextSpan(children: <TextSpan>[
                        new TextSpan(
                            text: "10",
                            style: new TextStyle(
                                fontSize: 18.0, color: StudentColors.s_484848)),
                        new TextSpan(
                            text: "名",
                            style: new TextStyle(
                                fontSize: 14.0, color: StudentColors.s_484848)),
                      ]),
                    )
                  ],
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "阅读时长",
                          style: new TextStyle(
                              fontSize: 12.0, color: StudentColors.s_484848),
                        ),
                        new Padding(
                          child: Image.asset(
                            "images/homepage_btn_arrow_ese.png",
                            width: 7.0,
                            height: 12.0,
                          ),
                          padding: const EdgeInsets.only(left: 2.5),
                        ),
                      ],
                    ),
                    new RichText(
                      text: new TextSpan(
                          style: new TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: "16",
                                style: new TextStyle(
                                    fontSize: 18.0,
                                    color: StudentColors.s_484848)),
                            new TextSpan(
                                text: "名",
                                style: new TextStyle(
                                    fontSize: 14.0,
                                    color: StudentColors.s_484848)),
                          ]),
                    )
                  ],
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "班级阅读墙",
                          style: new TextStyle(
                              fontSize: 12.0, color: StudentColors.s_484848),
                        ),
                        new Padding(
                          child: Image.asset(
                            "images/homepage_btn_arrow_ese.png",
                            width: 7.0,
                            height: 12.0,
                          ),
                          padding: const EdgeInsets.only(left: 2.5),
                        ),
                      ],
                    ),
                    new RichText(
                      text: new TextSpan(
                          style: new TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                          ),
                          children: <TextSpan>[
                            new TextSpan(
                                text: "10",
                                style: new TextStyle(
                                    fontSize: 18.0,
                                    color: StudentColors.s_484848)),
                            new TextSpan(
                                text: "名",
                                style: new TextStyle(
                                    fontSize: 14.0,
                                    color: StudentColors.s_484848)),
                          ]),
                    )
                  ],
                )
              ],
            ),
            padding: const EdgeInsets.only(top: 15.0),
          )
        ],
      ),
    );
  }

  /** 私人定制组件 */
  Widget _privateWedgit() {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
            child: Text("为你定制的私人书单"),
            padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
          ),
          new Padding(
            child: Image.asset(
              "images/homepage_btn_arrow_L.png",
              width: 10.0,
              height: 16.0,
            ),
            padding:
                const EdgeInsets.only(right: 15.0, top: 15.0, bottom: 15.0),
          ),
        ],
      ),
      color: Colors.white,
      margin: const EdgeInsets.only(top: 10.0),
    );
  }

  /** 广告组件 */
  Widget _banner() {
    return new Container(
      margin: const EdgeInsets.only(top: 11.0),
      child: new Container(height: 62.0,width: 347.0,
        margin: const EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 5.0),
        decoration: new ShapeDecoration(shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
     child:_bannerView(),
    
    ));
  }

  BannerView _bannerView() {
    return new BannerView(
      [
        // new Card(shape: new RoundedRectangleBorder(
        //               borderRadius: new BorderRadius.circular(4.0)),child:  new Image.asset("images/homepage_banner_ad1.png",fit: BoxFit.fill,),),
        // new Card(shape: new RoundedRectangleBorder(
        //               borderRadius: new BorderRadius.circular(4.0)),child:  new Image.asset("images/homepage_banner_ad2.png",fit: BoxFit.fill,),),
        // new Card(shape: new RoundedRectangleBorder(
        //               borderRadius: new BorderRadius.circular(4.0)),child:  new Image.asset("images/homepage_banner_ad1.png",fit: BoxFit.fill,),),

                 new Card(child: new Image.asset("images/homepage_banner_ad1.png",fit: BoxFit.fill,)),
                  new Card(child: new Image.asset("images/homepage_banner_ad2.png",fit: BoxFit.fill,)),
                   new Card(child: new Image.asset("images/homepage_banner_ad3.png",fit: BoxFit.fill,)),
                  
      ],
      log: false,
      indicatorMargin:4.0,
      indicatorNormal: new Container(
        width: 5.0,
        height: 5.0,
        decoration: new BoxDecoration(
          color: StudentColors.s_d1d1d1,
          shape: BoxShape.circle,
        ),
      ),
      indicatorSelected: new Container(
        width: 5.0,
        height: 5.0,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
         
        ),
      ),
      indicatorBuilder: (context, indicator) {
        Widget cc = new Align(alignment: Alignment.bottomCenter,child: Container(margin: const EdgeInsets.only(bottom: 2.0),
         alignment: Alignment.center,
          height: 15.0,
          width: double.infinity,
          color: Colors.transparent,
          child: indicator,
        ),);
        return cc;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(
                    "images/homepage_bg_top.png",
                  ),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter),
            ),
          ),
          new ListView(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  /// 顶部的内容
                  new Opacity(
                    opacity: 0.2,
                    child: Container(
                      height: 75.0,
                      margin: const EdgeInsets.only(right: 7.0, left: 7.0),
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(12.0)),
                    ),
                  ),

                  new Container(
                    margin: const EdgeInsets.only(right: 7.0, left: 7.0),
                    height: 75.0,
                    child: Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 12.0),
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(50.0),
                            border:
                                new Border.all(color: Colors.white, width: 2.0),
                          ),
                          width: 50.0,
                          height: 50.0,
                          child: new CircleAvatar(
                            backgroundImage: url != ""
                                ? new NetworkImage(url)
                                : new AssetImage(
                                    "images/defaul_head_parent.png"),
                          ),
                        ),
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 12.0),
                              child: new Row(crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    "陈明明",
                                    style: new TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                                  new Container(
                                    padding: const EdgeInsets.only(left: 4.5,top: 4.5),
                                    child: new Image.asset("images/icon_Lv3.png",width: 22.0,height: 9.0,)
                                  ),
                              
                                ],
                              ),
                            ),
                            Container(
                              width: 200.0,
                              padding:
                                  const EdgeInsets.only(top: 5.0, left: 12.0),
                              child: new Text(
                                "深圳市罗湖地区东路小学（天伦校区） 二年级2班",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 11.0),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        new Container(
                          padding: const EdgeInsets.only(top: 20.0, left: 12.0),
                          child: new Column(
                            children: <Widget>[
                              new Text(
                                "第一学期",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                              new Text(
                                "第5周",
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// 阅读的图形圆圈加字体
              new Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  _buildCircularChart(),
                  new Container(
                    width: 115.0,
                    height: 115.0,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new Text(
                            "今日阅读",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 12.0),
                          ),
                          padding: const EdgeInsets.only(top: 28.5),
                        ),
                        new Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text(
                                "25",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.0,
                                ),
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: new Text(
                                  "分钟",
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

              /// 去记录按钮
              new Container(
                width: 180.0,
                height: 40.0,
                child: new RaisedButton(
                  onPressed: null,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  disabledColor: const Color(0xfffde925),
                  highlightColor: const Color(0xffffd72c),
                  splashColor: const Color(0xfff4c925),
                  child: new Text(
                    "去记录",
                    style: new TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
                margin: const EdgeInsets.only(right: 100.0, left: 100.0),
              ),

              /// 阅读量时长和天数控件
              _buildLineWidget(),

              /// 下滑线
              new Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: new Divider(
                  height: 0.2,
                  color: StudentColors.s_999999,
                ),
              ),

              /// 每天30分钟
              new Container(
                color: Colors.white,
                child: new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        "每天30分钟，目标已达成2天",
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: StudentColors.s_666666,
                        ),
                      ),
                      timeWidget,
                    ],
                  ),
                ),
              ),
              classWall(),
              _privateWedgit(),
               _banner(),
            ],
          ),
        ],
      ),
    );
  }
}

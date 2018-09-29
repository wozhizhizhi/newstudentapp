import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'package:studentapp/colors/StudentColors.dart';
import 'package:studentapp/pages/TaskItemPage.dart';
import 'package:studentapp/util/ScreenUtil.dart';
import 'dart:async';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> with TickerProviderStateMixin {
  List<String> _tabs = ["语文", "数学", "英语", "美术", "音乐", "体育"];
  List<String> _buttonTabs = ["全部", "项目式学习", "同课研读"];
  TabController _tabController;
  PageController _pageController;
  int _curIndex = 0;
  double itemWith = 0.0;
  double itemHeight = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: _tabs.length, vsync: this);
    _pageController = new PageController(initialPage: _curIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  double getPhoneWith() {
    double itemWith = ScreenUtil.getScreenWidth(context);
    setState(() {
      itemWith = itemWith;
    });
    return itemWith;
  }

  /// PageView中onPageChanged代表页面改变的时候
  pageChanged(int index) {
    _curIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    itemWith = getPhoneWith();
    itemHeight = 65.0;
    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              elevation: 0.0,
              title: new Text(
                "我的任务",
                style: new TextStyle(
                    fontSize: 18.0, color: StudentColors.s_484848),
              ),
              centerTitle: true,
              expandedHeight: 295.0,
              backgroundColor: Colors.white,
              flexibleSpace: new FlexibleSpaceBar(
                background: new Container(
                  child: new Column(
                    children: <Widget>[
                      _banner(),
                      _readActivity(),
                    ],
                  ),
                  padding: const EdgeInsets.only(top: 75.0),
                ),
              ),
              pinned: true,
            ),
            new SliverPersistentHeader(
              delegate: new _SliverAppBarDelegate(
                builder: (BuildContext context) {
                  return new Container(
                    color: Colors.white,
                    child: new TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 3.0,
                        indicatorColor: StudentColors.tabTextSelectedColor,
                        labelColor: StudentColors.s_484848,
                        unselectedLabelColor: StudentColors.s_9a9a9a,
                        tabs: _tabs.map((name) {
                          return new Tab(
                            text: name,
                          );
                        }).toList()),
                  );
                },
              ),
              pinned: true,
            ),
//            new Divider(height: 1.0,color: StudentColors.s_f6f6f6,),
          ];
        },
        body: new TabBarView(
          children: _tabs.map((name) {
            return _buildTabview();
          }).toList(),
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _buildItemBarView() {
    return LayoutBuilder(builder:
        (BuildContext context, BoxConstraints viewportConstraints) {
      return new ConstrainedBox(
        constraints:
        new BoxConstraints(maxHeight: viewportConstraints.maxHeight),
        child: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new ListTile(
              subtitle: new Text("我的"),
              leading: new Icon(Icons.title),
              title: new Text("今天天气很好"),
            );
          },
          itemCount: 10,
        ),
      );
    });
  }

  Widget _buildTabview() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Divider(
            height: 1.0,
            color: StudentColors.s_f6f6f6,
          ),
          new Container(
            height: 49.0,
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new InkWell(
                  child: new Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: new Text(
                      _buttonTabs[0],
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ),
                new InkWell(
                  child: new Container(
                    child: new Text(
                      _buttonTabs[1],
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ),
                new InkWell(
                  child: new Container(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: new Text(
                      _buttonTabs[2],
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            child: new Container(
              child: new PageView.builder(
                // 禁止滑动
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  _buildItemBarView();
                },
                onPageChanged: pageChanged,
                controller: _pageController,
                itemCount: _buttonTabs.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /** 广告下面的阅读活动组件 */
  Widget _readActivity() {
    return new Expanded(
        child: new Container(
      color: StudentColors.s_ffffff,
      height: 128.0,
//        decoration: new ShapeDecoration(
//            shape: new RoundedRectangleBorder(
//                borderRadius: new BorderRadius.circular(15.0))),
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "阅读活动",
                  style:
                      TextStyle(color: StudentColors.s_484848, fontSize: 14.0),
                ),
                new Image.asset(
                  "images/homepage_btn_arrow_ese.png",
                  width: 12.0,
                  height: 12.0,
                )
              ],
            ),
          ),
          new Container(margin: const EdgeInsets.only(left: 15.0,top: 15.0),child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return new ConstrainedBox(
              constraints:
                  new BoxConstraints(minWidth: viewportConstraints.maxWidth,maxHeight: 65.0),
              child: new ListView.builder(
                itemBuilder: (context, index) {
                  return new Card(
                    child:  new Image.asset(
                      "images/task_banner_ad1.png",
                      width: 120.0,
                      height: 65.0,
                      fit: BoxFit.fill,
                    ),
                  );
                },
                itemCount: 6,
                scrollDirection: Axis.horizontal,
              ),
            );
          }),),
        ],
      ),
    ));
  }

  /** 广告组件 */
  Widget _banner() {
    return new Container(
      height: 120.0,
//        decoration: new ShapeDecoration(
//            shape: new RoundedRectangleBorder(
//                borderRadius: new BorderRadius.circular(15.0))),
      child: _bannerView(),
    );
  }

  BannerView _bannerView() {
    return new BannerView(
      [
        new Image.asset(
          "images/task_banner_ad1.png",
          fit: BoxFit.fill,
        ),
        new Image.asset(
          "images/task_banner_ad2.png",
          fit: BoxFit.fill,
        ),
        new Image.asset(
          "images/task_banner_ad3.png",
          fit: BoxFit.fill,
        ),
      ],
      log: false,
      indicatorMargin: 4.0,
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
        Widget cc = new Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(bottom: 2.0),
            alignment: Alignment.center,
            height: 15.0,
            width: double.infinity,
            color: Colors.transparent,
            child: indicator,
          ),
        );
        return cc;
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({this.builder}) : assert(builder != null);

  WidgetBuilder builder;

  @override
  double get minExtent => 46.0;

  @override
  double get maxExtent => 46.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: builder(context),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

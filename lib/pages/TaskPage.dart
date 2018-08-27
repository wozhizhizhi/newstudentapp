import 'package:flutter/material.dart';
import 'package:banner_view/banner_view.dart';
import 'package:studentapp/colors/StudentColors.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> with TickerProviderStateMixin {
  List<String> _tabs = ["图书", "学校", "老师"];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "我的任务",
          style: new TextStyle(fontSize: 18.0, color: Colors.grey[600]),
        ),
      ),
      body: new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new PreferredSize(
              preferredSize: new Size.fromHeight(44.0),
              child: new SliverAppBar(
                expandedHeight: 156.0,
                flexibleSpace: new FlexibleSpaceBar(
                  background: _banner(),
                ),
                pinned: false,
              ),
            ),
          ];
        },
        body: new Center(
          child: new Text("Hello"),
        ),
      ),
    );
  }
}

/** 广告组件 */
Widget _banner() {
  return new Container(
    height: 156.0,
//        decoration: new ShapeDecoration(
//            shape: new RoundedRectangleBorder(
//                borderRadius: new BorderRadius.circular(15.0))),
    child: _bannerView(),
  );
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

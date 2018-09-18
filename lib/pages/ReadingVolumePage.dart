import 'package:flutter/material.dart';
import 'package:studentapp/mywidget/MyAppBar.dart';
import 'package:studentapp/colors/StudentColors.dart';
import 'package:studentapp/pages/VolumePage.dart';
import 'package:studentapp/pages/ReadTimePage.dart';

/**
 * 阅读量的页面
 */
class ReadingVolumePage extends StatefulWidget {
  int pageIndex = 0;
  ReadingVolumePage({Key key , this.pageIndex}):super(key:key);
  @override
  _ReadingVolumePageState createState() => new _ReadingVolumePageState();
}

class _ReadingVolumePageState extends State<ReadingVolumePage> {
  PageController _pageController;
  int _index = 0;
  List<String> titles = ["阅读量", "阅读时长"];
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(initialPage: _index);
    if (widget.pageIndex == 0){
      _index = 0;

    }
    else if (widget.pageIndex == 1){
      _index = 1;
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new MyAppBar(
        leading: new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Image.asset(
            "images/btn_back_yellow.png",
            fit: BoxFit.scaleDown,
          ),
        ),
        actions: <Widget>[
          new Container(
            child: new Text(
              "规则",
              style: TextStyle(color: StudentColors.s_484848, fontSize: 15.0),
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 13.0),
          ),
        ],
        centerTitle: true,
        title: new Container(
          width: 170.0,
          height: 30.0,
          child: new Row(
            children: <Widget>[
              new InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: 85.0,
                  height: 30.0,
                  decoration: new BoxDecoration(
                    border:
                        Border.all(width: 1.0, color: StudentColors.s_22b2e1),
                    color: getBgColor(0),
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                  ),
                  child: new Text(
                    titles[0],
                    style: TextStyle(fontSize: 16.0, color: getSelectColor(0)),
                  ),
                ),
                onTap: (){
                  setState(() {
                    _index = 0;
                    _pageController.animateToPage(_index, duration: new Duration(milliseconds: 300), curve: Curves.easeOut);
                  });
                },
              ),
              new InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: 85.0,
                  height: 30.0,
                  decoration: new BoxDecoration(
                    border:
                        Border.all(width: 1.0, color: StudentColors.s_22b2e1),
                    color: getBgColor(1),
                    borderRadius: new BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: new Text(
                    titles[1],
                    style: TextStyle(fontSize: 16.0, color: getSelectColor(1)),
                  ),
                ),
                onTap: (){
                  setState(() {
                    _index = 1;
                    _pageController.animateToPage(_index, duration: new Duration(milliseconds: 300), curve: Curves.easeOut);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: new PageView(
          onPageChanged: pageChanged,
          controller: _pageController,
          children: <Widget>[
            new VolumePage(),
            new ReadTimePage(),
          ],
        ),
    );
  }

  /// 选中于未选中的文字颜色转换效果
  Color getSelectColor(int index) {
    if (index == _index) {
      return Colors.white;
    } else {
      return StudentColors.s_22b2e1;
    }
  }

  /// 背景色选中于未选中的效果
  Color getBgColor(int index) {
    if (index == _index) {
      return StudentColors.s_22b2e1;
    } else {
      return Colors.white;
    }
  }

  /// PageView中onPageChanged代表页面改变的时候
  pageChanged(int index) {
    _index = index;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController?.dispose();
    super.dispose();
  }
}

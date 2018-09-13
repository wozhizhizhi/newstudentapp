import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:studentapp/colors/StudentColors.dart';
import 'package:studentapp/pages/ReadCirclePage.dart';
import 'package:studentapp/pages/TaskPage.dart';
import 'package:studentapp/pages/UserPage.dart';
import 'package:studentapp/pages/ReadPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bottomTitle = ["悦读", "任务", "悦读圈", "我"];
  var tabImages;
  var _body;
  int _curIndex = 0;

  /// 文字的选中效果
  final TextStyle textSelected =
      new TextStyle(color: StudentColors.tabTextSelectedColor);

  /// 文字未选中效果
  final TextStyle textUnSelected = new TextStyle(
      color: StudentColors.tabTextUnSelectedColor);

  Image getImage(path) {
    return Image.asset(
      path,
      width: 25.0,
      height: 25.0,
    );
  }

  /// 初始化图片
  _initImage() {
    tabImages = [
      [
        getImage("images/img_tab_guide_normal.png"),
        getImage("images/img_tab_guide.png")
      ],
      [
        getImage("images/img_tab_library_normal.png"),
        getImage("images/img_tab_library.png")
      ],
      [
        getImage("images/bar_icon_reading_circle.png"),
        getImage("images/bar_icon_reading_circle2.png")
      ],
      [
        getImage("images/img_tab_userinfo_normal.png"),
        getImage("images/img_tab_userinfo.png")
      ],
    ];
  }

  /// 初始化页面
  _initPage() {
    _body = new IndexedStack(
      children: <Widget>[
        new ReadPage(),
        new TaskPage(),
        new ReadCirclePage(),
        new UserPage(),
      ],
      index: _curIndex,
    );
  }

  /// 获取文字选中与未选中的效果
  TextStyle _textSelected(int index) {
    if (_curIndex == index) {
      return textSelected;
    }
    return textUnSelected;
  }

  /// 图片选中与未选中的效果
  Image selectedImage(int index) {
    if (_curIndex == index) {
      return tabImages[index][1];
    }
    return tabImages[index][0];
  }

  /// bottom文字的切换
  Text _selectedText(int index) {
    return new Text(
      bottomTitle[index],
      style: _textSelected(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    _initImage();
    _initPage();

    return new Scaffold(
      body: _body,
      bottomNavigationBar: new CupertinoTabBar(items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: selectedImage(0), title: _selectedText(0)),
        new BottomNavigationBarItem(
            icon: selectedImage(1), title: _selectedText(1)),
        new BottomNavigationBarItem(
            icon: selectedImage(2), title: _selectedText(2)),
        new BottomNavigationBarItem(
            icon: selectedImage(3), title: _selectedText(3)),
      ],
      currentIndex: _curIndex,
      onTap: (index){
        setState(() {
          _curIndex = index;
        });
      },),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:studentapp/colors/StudentColors.dart';

class TaskItemPage extends StatefulWidget {
  String name;
  TaskItemPage({Key key, @required this.name}) : super(key: key);
  @override
  _TaskItemPageState createState() => _TaskItemPageState();
}

class _TaskItemPageState extends State<TaskItemPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(
      text: "全部",
    ),
    new Tab(
      text: "项目式学习",
    ),
    new Tab(
      text: "同课研读",
    )
  ];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: tabs.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: new TabBar(
            tabs: tabs,
          ),
        ),
        body: new TabBarView(physics: NeverScrollableScrollPhysics(),
          children: tabs.map((Tab tab) {
            return  new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return new ListTile(
                  title: new Text(tab.text),
                );
              },
              itemCount: 10,
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
}

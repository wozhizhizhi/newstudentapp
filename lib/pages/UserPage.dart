import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return new CupertinoTabScaffold(
      tabBar: new CupertinoTabBar(
        items: <BottomNavigationBarItem> [
          new BottomNavigationBarItem(icon: new Icon(Icons.map), title: new Text("left")),
          new BottomNavigationBarItem(icon:  new Icon(Icons.cached), title: new Text("right")),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return new CupertinoTabView(
          builder: (BuildContext context) {
            return new CupertinoPageScaffold(
              navigationBar: new CupertinoNavigationBar(
                middle: new Text('Page 1 of tab $index'),
              ),
              child: new Center(
                child: new CupertinoButton(
                  child: const Text('Next page'),
                  onPressed: () {
                    Navigator.of(context).push(
                      new CupertinoPageRoute<Null>(
                        builder: (BuildContext context) {
                          return new CupertinoPageScaffold(
                            navigationBar: new CupertinoNavigationBar(
                              middle: new Text('Page 2 of tab $index'),
                            ),
                            child: new Center(
                              child: new CupertinoButton(
                                child: const Text('Back'),
                                onPressed: () { Navigator.of(context).pop(); },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

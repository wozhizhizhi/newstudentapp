import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final List<Widget> actions;
  final Color backgroundColor;
  MyAppBar(
      {Key key, this.leading, this.title, this.actions, this.backgroundColor})
      : super(key: key);
  @override
  Size get preferredSize => new Size.fromHeight(48.0);
  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: widget.title,
      leading: widget.leading,
      actions: widget.actions,
      backgroundColor: widget.backgroundColor,
    );
  }
}

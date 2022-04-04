import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_bus/screen/map_screen.dart';
import 'package:school_bus/widget/button_widget.dart';
import 'package:school_bus/widget/navigation_drawer_widget.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      // endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(),
      body: Builder(
        builder: (context) => MapScreen(),
      ),
    );
  }
}

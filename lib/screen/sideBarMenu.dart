import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_bus_za/functions/drawer_fun.dart';
import 'package:school_bus_za/screen/map_screen.dart';

import 'package:school_bus_za/widget/navigation_drawer_widget.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  DrawerFun _drawerFun = DrawerFun();
  String name;
  String imageUrl;

  Future _initFun() async{
    await _drawerFun.getParentDetails().then((value) {
      setState(() {
        name = value['name'];
        imageUrl = value['image_url'];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async{
      await _initFun();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(
        name: name,
        urlImage: imageUrl,
      ),
      // endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(),
      body: Builder(
        builder: (context) => MapScreen(),
      ),
    );
  }
}

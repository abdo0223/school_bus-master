import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_za/helper/componanets.dart';

import 'package:school_bus_za/screen/chat/chat_screen.dart';
import 'package:school_bus_za/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus_za/screen/chat/cubit/chatscreen_state.dart';
import 'package:school_bus_za/screen/contact_us.dart';
import 'package:school_bus_za/screen/homeProfile.dart';
import 'package:school_bus_za/screen/find_bus.dart';
import 'package:school_bus_za/screen/login.dart';
import 'package:school_bus_za/screen/profile_screen.dart';
import 'package:school_bus_za/screen/setting_screen.dart';
import 'package:school_bus_za/screen/wallet_screen.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'abdo ali';
    final email = 'ali@gmail.com';
    final urlImage = 'assets/image/abdo.jpg';

    return BlocConsumer<ChatCubit, SchoolState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ChatCubit.get(context).userModel;

        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - 110,
            // margin: EdgeInsets.only(
            //   top: 30,
            //   bottom: 30,
            // ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
              child: Drawer(
                child: Material(
                  color: Color(0XFFFFAB4C),
                  child: ListView(
                    children: <Widget>[
                      buildHeader(
                          urlImage: /* model.profileImage */ urlImage,
                          name: /* model.name */ name,
                          email: email /* model.email */,
                          onClicked: () {}),
                      Container(
                        padding: padding,
                        child: Column(
                          children: [
                            const SizedBox(height: 0),
                            //  buildSearchField(),
                            const SizedBox(height: 8),
                            buildMenuItem(
                                text: 'Add Child',
                                icon: Icons.child_care,
                                onClicked: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ))),
                            buildMenuItem(
                              text: 'Find School Bus',
                              icon: Icons.location_pin,
                              onClicked: () => selectedItem(context, 0),
                            ),
                            const SizedBox(height: 8),
                            buildMenuItem(
                              text: 'Call Driver',
                              icon: Icons.call,
                              onClicked: () => selectedItem(context, 1),
                            ),
                            const SizedBox(height: 8),
                            buildMenuItem(
                              text: 'Wallet',
                              icon: Icons.money,
                              onClicked: () => selectedItem(context, 2),
                            ),
                            const SizedBox(height: 8),
                            buildMenuItem(
                              text: 'Profile',
                              icon: Icons.person,
                              onClicked: () => selectedItem(context, 3),
                            ),
                            const SizedBox(height: 10),
                            Divider(color: Colors.white70),
                            const SizedBox(height: 8),
                            buildMenuItem(
                              text: 'Settings',
                              icon: Icons.settings,
                              onClicked: () => selectedItem(context, 4),
                            ),
                            const SizedBox(height: 8),
                            buildMenuItem(
                              text: 'Contact Us',
                              icon: Icons.quick_contacts_mail_rounded,
                              onClicked: () => selectedItem(context, 5),
                            ),
                            buildMenuItem(
                                text: 'Logout',
                                icon: Icons.logout,
                                onClicked: () => navigateAndFinish(
                                    context, SchoolLoginScreen())),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHeader({
    @required String urlImage,
    @required String name,
    @required String email,
    @required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: AssetImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 28.0,
                backgroundImage: AssetImage("assets/image/idealogo3.png"),
                backgroundColor: Colors.transparent,
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    @required String text,
    @required IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FindBus(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChatsScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WalletScreen(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsScreen(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutUsScreen(),
        ));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:school_bus/screen/chat/chat_screen.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_state.dart';
import 'package:school_bus/screen/contact_us.dart';
import 'package:school_bus/screen/cubit/homeProfile.dart';
import 'package:school_bus/screen/map_screen.dart';
import 'package:school_bus/screen/profile_screen.dart';
import 'package:school_bus/screen/setting_screen.dart';
import 'package:school_bus/screen/wallet_screen.dart';

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

        return Drawer(
          child: Material(
            color: Color(0XFFFFAB4C),
            child: ListView(
              children: <Widget>[
                buildHeader(
                  urlImage: /* model.profileImage */ urlImage,
                  name: /* model.name */ name,
                  email: email /* model.email */,
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  )),
                ),
                Container(
                  padding: padding,
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      //  buildSearchField(),
                      const SizedBox(height: 24),
                      buildMenuItem(
                        text: 'Find School Bus',
                        icon: Icons.location_pin,
                        onClicked: () => selectedItem(context, 0),
                      ),
                      const SizedBox(height: 16),
                      buildMenuItem(
                        text: 'Call Driver',
                        icon: Icons.call,
                        onClicked: () => selectedItem(context, 1),
                      ),
                      const SizedBox(height: 16),
                      buildMenuItem(
                        text: 'Wallet',
                        icon: Icons.money,
                        onClicked: () => selectedItem(context, 2),
                      ),
                      const SizedBox(height: 16),
                      buildMenuItem(
                        text: 'Profile',
                        icon: Icons.person,
                        onClicked: () => selectedItem(context, 3),
                      ),
                      const SizedBox(height: 24),
                      Divider(color: Colors.white70),
                      const SizedBox(height: 24),
                      buildMenuItem(
                        text: 'Settings',
                        icon: Icons.settings,
                        onClicked: () => selectedItem(context, 4),
                      ),
                      const SizedBox(height: 16),
                      buildMenuItem(
                        text: 'Contact Us',
                        icon: Icons.quick_contacts_mail_rounded,
                        onClicked: () => selectedItem(context, 5),
                      ),
                    ],
                  ),
                ),
              ],
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
          builder: (context) => MapScreen(),
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
          builder: (context) => SettingScreeen(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ContactUsScreen(),
        ));
    }
  }
}

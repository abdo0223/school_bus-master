import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_za/network/dio_helper.dart';

import 'package:school_bus_za/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus_za/screen/chat/cubit/chatscreen_state.dart';

import 'package:school_bus_za/screen/login.dart';
import 'package:school_bus_za/screen/map_screen.dart';
import 'package:school_bus_za/screen/sideBarMenu.dart';

import 'package:school_bus_za/shared/cash_helper.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screen/chat/cubit/chatscreen_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp());
  var uid = CacheHelper.getData(key: 'uId');
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  final Widget startWidget;

  const MyApp({this.onBoarding, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => ChatCubit()..getUserData()),
      ],
      child: BlocConsumer<ChatCubit, SchoolState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'Poppins',
                scaffoldBackgroundColor: Color(0XFFFFAB4C),
                primaryColor: const Color(0XFFFFAB4C),
                textSelectionTheme: const TextSelectionThemeData(selectionColor
                    : Colors.black),
                primarySwatch: Colors.blueGrey,
                canvasColor: Colors.white,
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  color: Color(0XFFFFAB4C),
                )),
            home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
                builder: (ctx, snapShot){
                  if(snapShot.hasData) {
                    return SideBar();
                  }
                  else{
                    return SchoolLoginScreen();
                  }
                }),

            //SchoolLoginScreen(),
          );
        },
      ),
    );
  }
}

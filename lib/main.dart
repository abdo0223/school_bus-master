import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus/network/dio_helper.dart';
import 'package:school_bus/register.dart/cubit.dart';
import 'package:school_bus/register.dart/state.dart';

import 'package:school_bus/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_state.dart';

import 'package:school_bus/screen/cubit/profile_screen.dart';
import 'package:school_bus/screen/login.dart';
import 'package:school_bus/shared/cash_helper.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screen/chat/cubit/chatscreen_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  runApp(MyApp());
  var uId = CacheHelper.getData(key: 'uId');
  if (uId != null) {
    widget = HomeScreen();
  } else {
    widget = SchoolLoginScreen();
  }
}

class MyApp extends StatelessWidget {
  final bool onBoarding;
  final Widget startWidget;

  const MyApp({this.onBoarding, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SchoolRegisterCubit()),
      ],
      child: BlocConsumer<SchoolRegisterCubit, SchoolRegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'Poppins',
                scaffoldBackgroundColor: Color(0XFFFFAB4C),
                primarySwatch: Colors.blueGrey,
                canvasColor: Colors.white,
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  color: Color(0XFFFFABC),
                )),
            home: SchoolLoginScreen(),
          );
        },
      ),
    );
  }
}

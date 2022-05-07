
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:school_bus_za/helper/componanets.dart';
import 'package:school_bus_za/screen/chat/chat_detail_sscreen.dart';

import 'package:school_bus_za/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus_za/screen/chat/cubit/chatscreen_state.dart';
import 'package:school_bus_za/screen/chat_z/chat_z_screen.dart';

class InfoDriver extends StatelessWidget {
  const InfoDriver({Key key, @required this.driverName,
  @required this.carType, @required this.driverPic, @required this.number}) : super(key: key);
  final String driverName;
  final String driverPic;
  final String carType;
  final String number;



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, SchoolState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundImage: NetworkImage(driverPic),
                        backgroundColor: Colors.transparent,
                      ),
                      Text(
                        driverName,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.call_outlined,
                                  color: Color(0XFFFFAB4C),
                                ),
                                onPressed: () {
                                  FlutterPhoneDirectCaller.callNumber(number); //model.phoneNumOfDriver
                                }),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.sms_outlined,
                                  color: Color(0XFFFFAB4C),
                                ),
                                onPressed: () {
                                  navigateTo(context, ChatScreen(driverUid: 'o6OU71joT5XjDalgogPRLbYrZl22'));
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundImage: AssetImage("assets/image/bus.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                      Text(
                        carType,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "م ت و|123",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .23,
            color: Color(0XFFFFAB4C),
          ),
        );
      },
    );
  }
}

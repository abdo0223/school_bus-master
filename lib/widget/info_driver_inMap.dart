import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:school_bus/helper/componanets.dart';
import 'package:school_bus/screen/chat/chat_detail_sscreen.dart';
import 'package:school_bus/screen/chat/chat_screen.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_state.dart';

class InfoDriver extends StatelessWidget {
  const InfoDriver({Key key}) : super(key: key);

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
                        backgroundImage: AssetImage("assets/image/abdo.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                      Text(
                        "Ahmed Gamal",
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
                                  FlutterPhoneDirectCaller.callNumber(
                                      "01550511745"); //model.phoneNumOfDriver
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
                                  navigateTo(context, ChatDetailsScreen());
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
                        "Toyota S7",
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

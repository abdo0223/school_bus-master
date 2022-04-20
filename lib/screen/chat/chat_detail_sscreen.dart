import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus_za/model/school_user.dart';
import 'package:school_bus_za/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus_za/screen/chat/cubit/chatscreen_state.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ChatDetailsScreen extends StatelessWidget {
  SchoolUserModel model;
  ChatDetailsScreen({this.model});
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return BlocConsumer<ChatCubit, SchoolState>(
            listener: (context, state) {},
            builder: (context, state) {
              //ChatCubit.get(context).getMessages(receiverId: model.uId);
              return BlocConsumer<ChatCubit, SchoolState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Stack(
                    children: [
                      Container(
                        color: Color(0XFFFFAB4C),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 10, left: 10, right: 10),
                        child: SafeArea(
                          child: Scaffold(
                              appBar: AppBar(
                                shadowColor: Color(0XFFFFAB4C),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35))),
                                leading: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Color(0XFFFFAB4C),
                                    size: 28,
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                backgroundColor: Colors.white,
                                titleSpacing: 0.0,
                                title: Row(
                                  children: [
                                    /*  CircleAvatar(
                                  radius: 20.0,
                                  /* backgroundImage: AssetImage(
                                      "assets/image/busw.jpg"), // NetworkImage(model.image), */ */

                                    CircleAvatar(
                                      backgroundColor: Color(0XFFFFAB4C),
                                      radius: 23,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 22,
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.call,
                                                color: Color(0XFFFFAB4C),
                                              ),
                                              onPressed: () {
                                                FlutterPhoneDirectCaller.callNumber(
                                                    "01550511745"); //model.phoneNumOfDriver
                                              })),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Abdo", // Text(model.name,style: TextStyle(fontSize: 15),)
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0XFFFFAB4C),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              body: ConditionalBuilder(
                                condition: ChatCubit.get(context)
                                            .messages
                                            .length >
                                        0 ||
                                    ChatCubit.get(context).messages.length == 0,
                                builder: (context) => Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      )),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ListView.separated(
                                              physics: BouncingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                var message =
                                                    ChatCubit.get(context)
                                                        .messages[index];
                                                if (ChatCubit.get(context)
                                                        .userModel
                                                        .uId ==
                                                    message.senderId)
                                                  return buildMyMessage(
                                                      message);
                                                if (ChatCubit.get(context)
                                                        .userModel
                                                        .uId ==
                                                    message.receiverId)
                                                  return buildMessage(message);
                                              },
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                        height: 16,
                                                      ),
                                              itemCount: ChatCubit.get(context)
                                                  .messages
                                                  .length)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.5,
                                                  color: Color(0XFFFFAB4C)),
                                              borderRadius:
                                                  BorderRadius.circular(18.0)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: TextFormField(
                                                    controller: textController,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            'type your message here ...',
                                                        border:
                                                            InputBorder.none),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                color: Color(0XFFFFAB4C),
                                                child: MaterialButton(
                                                    height: 40.0,
                                                    minWidth: 50.0,
                                                    onPressed: () {
                                                      ChatCubit.get(context)
                                                          .sendMessage(
                                                              receiverId:
                                                                  model.uId,
                                                              dateTime: DateTime
                                                                      .now()
                                                                  .toString(),
                                                              text:
                                                                  textController
                                                                      .text);
                                                    },
                                                    child: Text("SEND")),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  );
                },
              );
            });
      },
    );
  }

  Widget buildMessage(SchoolChatModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10.0),
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text('hi'),
            )),
      );
  Widget buildMyMessage(SchoolChatModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[300].withOpacity(.2),
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10.0),
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text('hello'),
            )),
      );
}

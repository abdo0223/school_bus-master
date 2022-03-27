import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus/model/school_user.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_cubit.dart';
import 'package:school_bus/screen/chat/cubit/chatscreen_state.dart';
import 'package:school_bus/shared/cash_helper.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel model;
  ChatDetailsScreen({this.model});
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.get(context).getMessages(receiverId: model.uId);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(model.image),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        model.name,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                body: ConditionalBuilder(
                  condition: SocialCubit.get(context).messages.length > 0 ||
                      SocialCubit.get(context).messages.length == 0,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                var message =
                                    SocialCubit.get(context).messages[index];
                                if (SocialCubit.get(context).userModel.uId ==
                                    message.senderId)
                                  return buildMyMessage(message);
                                if (SocialCubit.get(context).userModel.uId ==
                                    message.receiverId)
                                  return buildMessage(message);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 16,
                                  ),
                              itemCount:
                                  SocialCubit.get(context).messages.length),
                        ),
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.0, color: Colors.grey[300]),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: TextFormField(
                                    controller: textController,
                                    decoration: InputDecoration(
                                        hintText: 'type your message here ...',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                              Container(
                                color: Colors.lightBlueAccent,
                                child: MaterialButton(
                                  height: 40.0,
                                  minWidth: 50.0,
                                  onPressed: () {
                                    SocialCubit.get(context).sendMessage(
                                        receiverId: model.uId,
                                        dateTime: DateTime.now().toString(),
                                        text: textController.text);
                                  },
                                  child: Icon(
                                    Icons.send,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ));
          },
        );
      },
    );
  }

  Widget buildMessage(SocialChatModel model) => Align(
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
              child: Text('${model.text}'),
            )),
      );
  Widget buildMyMessage(SocialChatModel model) => Align(
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
              child: Text('${model.text}'),
            )),
      );
}


import 'package:flutter/material.dart';

import '../../../functions/chat_fun.dart';
import 'chat_widget_send_message_button.dart';
import 'chat_widget_send_message_text_field.dart';


class ChatWidgetSendMessage extends StatefulWidget {
  const ChatWidgetSendMessage({Key key, @required this.driverUid}) : super(key: key);
  final String driverUid;

  @override
  State<ChatWidgetSendMessage> createState() => _ChatWidgetSendMessageState();
}

class _ChatWidgetSendMessageState extends State<ChatWidgetSendMessage> {
  final TextEditingController controller = TextEditingController();

  final ChatFun _chatFun = ChatFun();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          ChatWidgetSendMessageTextField(controller: controller),
          ChatWidgetSendMessageButton(function: () async{
            String text = controller.text;
            setState(() {controller.clear();});
            await _chatFun.sendMessage(msg: text, driverUid: widget.driverUid);
          })
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1)
      ),
    );
  }
}




import 'package:flutter/material.dart';

import '../../functions/chat_fun.dart';
import '../../widget/chat_widgets/chat_send_messages_widgets/chat_widget_send_message.dart';
import '../../widget/chat_widgets/chat_widget_stream_chat.dart';




class ChatScreen extends StatefulWidget {
  const ChatScreen({Key key, @required this.driverUid}) : super(key: key);
  final String driverUid;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  
  String parentName = '';
  String phoneNumber = '';
  String parentImage = '';
  final ChatFun _chatFun = ChatFun();

  Future _initFun() async{
    await _chatFun.getParentDetails(driverUid: widget.driverUid).then((value) {
      setState(() {
        parentName = value['name'];
        phoneNumber = value['phone'];
        parentImage = value['image_url'];
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

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.phone, color: Theme.of(context).primaryColor,
            size: 30))
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).primaryColor,
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(parentImage),
              ),
            ),
            const Padding(padding: EdgeInsets.only(right: 10)),
            Text(parentName, style: const TextStyle(color: Colors.black, fontSize: 20)),

          ],
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        shadowColor: Theme.of(context).primaryColor.withOpacity(0.8),
      ),

      body: Stack(

        alignment: Alignment.bottomCenter,

        children: [
          ChatWidgetStreamChat(driverUid: widget.driverUid),
          ChatWidgetSendMessage(driverUid: widget.driverUid)
        ],
      ),
    );
  }
}

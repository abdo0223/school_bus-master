
import 'dart:io';

import 'package:flutter/material.dart';




class LoginWidgetImagePicker extends StatelessWidget {
  const LoginWidgetImagePicker({Key key, @required this.function,
    @required this.path}) : super(key: key);
  final Function() function;
  final String path;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: CircleAvatar(
          radius: 48,
          backgroundColor: Colors.white,
          backgroundImage: path.isEmpty?null:FileImage(File(path)),
          child: path.isEmpty?const Center(
            child: Icon(Icons.camera_alt, size: 40, color: Colors.grey,),
          ):null,
        ),
      ),
    );
  }
}

//storage/emulated/0/WhatsApp/Media/WhatsApp Images/IMG-20220429-WA0005.jpg

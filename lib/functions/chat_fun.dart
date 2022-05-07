

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ntp/ntp.dart';



class ChatFun{


  Future<Map> getParentDetails({@required String driverUid}) async{
    Map _details = {};
    await FirebaseFirestore.instance.collection('drivers').doc(driverUid).get()
        .then((value) {
      _details['name'] = value.data()['name'];
      _details['phone'] = value.data()['mobile'];
      _details['image_url'] = value.data()['profile_pic'];
    });
    return _details;
  }



  Future sendMessage({ @required String msg, @required String driverUid}) async{

    DateTime _myTime;
    _myTime = await NTP.now();
    await FirebaseFirestore.instance.collection('chat')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection(driverUid).doc().set({
      'text': msg,
      'createdAt': _myTime,
      'userId': FirebaseAuth.instance.currentUser?.uid
    });

    await FirebaseFirestore.instance.collection('chat')
        .doc(driverUid)
        .collection(FirebaseAuth.instance.currentUser.uid)
        .doc().set({
      'text': msg,
      'createdAt': _myTime,
      'userId': FirebaseAuth.instance.currentUser.uid
    });
  }

}
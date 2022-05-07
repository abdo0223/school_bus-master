// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddChildFun {

  Future addChildFun({@required String childName,
    @required String address,
    @required String schoolName,
    @required String path,
    @required BuildContext ctx
  }) async{

    final ref = FirebaseStorage.instance.ref()
        .child("children/").child("$childName${FirebaseAuth.instance.currentUser.uid}${".jpg"}");
    TaskSnapshot snapShot = await ref.putFile(File(path));

    final imageUrl = await snapShot.ref.getDownloadURL();

    int childrenNum = await FirebaseFirestore.instance.collection('parents').doc(
      FirebaseAuth.instance.currentUser.uid).get().then((value) {
        return value['children_num'];
    });

    FirebaseFirestore.instance.collection('parents').doc(
        FirebaseAuth.instance.currentUser.uid).update({
      'children_num': childrenNum + 1
    });

    await FirebaseFirestore.instance.collection('children').doc().set({
      'address': address,
      'name': childName,
      'parent_uid': FirebaseAuth.instance.currentUser.uid,
      'school_name': schoolName,
      'profile_pic': imageUrl
    });
    
    Navigator.pop(ctx);
  }

}
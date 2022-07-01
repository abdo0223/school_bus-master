import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class SignUpFun {


  Future createParent({
    @required String userName, @required String email,
    @required String password, @required String confirmPassword,
    @required String phoneNumber, @required String path}) async{





    final ref = FirebaseStorage.instance.ref().child("parent/").child("$email${".jpg"}");

    TaskSnapshot snapShot;
    try {
      snapShot = await ref.putFile(File(path));
    } on FirebaseException catch (e){
    }

    final imageUrl = await snapShot.ref.getDownloadURL();
    print(imageUrl);

    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance.collection('parents').doc(FirebaseAuth.instance.currentUser.uid)
        .set({'name': userName, 'phone': phoneNumber, 'profile_image': imageUrl, 'children_num': 0,

    });

  }
}
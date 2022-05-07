import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerFun {
  
  Future<Map> getParentDetails() async{
    Map details = {};
    await FirebaseFirestore.instance.collection('parents').doc(FirebaseAuth.instance.currentUser.uid)
        .get().then((value) {
          print('\n\n');
          print(value.get('name'));
          print(value.get('profile_image'));
          print('\n\n');
          details['name'] = value.get('name');
          details['image_url'] = value.get('profile_image');
        });
    return details;
  }
}
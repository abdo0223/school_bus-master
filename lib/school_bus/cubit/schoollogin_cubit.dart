// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_bus_za/helper/constants.dart';
import 'package:school_bus_za/model/school_user.dart';
import 'package:school_bus_za/register.dart/state.dart';
import 'package:school_bus_za/school_bus/cubit/schoollogin_state.dart';
import 'package:school_bus_za/shared/cash_helper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SchoolLoginCubit extends Cubit<SchoolLoginState> {
  SchoolLoginCubit() : super(SchoolLoginIntialState());

  static SchoolLoginCubit get(context) => BlocProvider.of(context);
  SchoolUserModel model;

  void getUserData() {
    emit(SchoolGetUserLoadingState());
    uId = CacheHelper.getData(key: 'uId');
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      model = SchoolUserModel.fromjson(value.data());
      emit(SchoolGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SchoolGetUsererrorState(error.toString()));
    });
  }

  void userLogin({
    @required String email,
    @required String password,
  }) {
    emit(SchoolLoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);

      String uId;
      emit(SchoolLoginSuccessState(uId));
    }).catchError((error) {
      SchoolLoginERRORState(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SchoolChangePasswordVisibiltyState());
  }

  IconData suffixx = Icons.visibility_outlined;

  bool isConfirm = true;

  void confirmPasswordVisibility() {
    isConfirm = !isConfirm;
    suffixx =
        isConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SchoolConfirmPasswordVisibiltyState());

    suffixx =
        isConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SchoolConfirmPasswordVisibiltyState());
  }

  File profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    //  final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);

      emit(SchoolProfileImagePickedSuccessState());
    } else {
      print("no image selected");
      emit(SchoolProfileImagePickedErrorState());
    }
  }

  String profileImageUrl = '';
  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SchoolUploadProfileImagePickedSuccessState());
        print(value);

        profileImageUrl = value;
      }).catchError((error) {
        SchoolUploadProfileImagePickedErrorState();
      }).catchError((error) {
        emit(SchoolUploadProfileImagePickedErrorState());
      });
    });
  }

/////////////////////////////////////////////
  profileUbdate({
    @required String childName,
    @required String chlildAddress,
    @required String schoolName,
    @required String schoollocation,
    @required String phone,
    @required String name,
    @required BuildContext ctx,
    String profileImage,
  }) async {
    emit(SchoolLoginLoadingState());

    String email = FirebaseAuth.instance.currentUser.email;
    String uId = FirebaseAuth.instance.currentUser.uid;
    print(schoolName);
    print(schoollocation);
    print(email);
    print(phone);
    print(childName);

    await profileCreate(
        uId: uId,
        name: name,
        email: email,
        childName: childName,
        chlildAddress: chlildAddress,
        phone: phone,
        schoolName: schoolName,
        profileImage: profileImageUrl,
        schoollocation: schoollocation);
  }

  profileCreate({
    @required String childName,
    @required String chlildAddress,
    @required String schoolName,
    @required String schoollocation,
    @required String phone,
    @required String email,
    @required String name,
    @required String uId,
    @required String profileImage,
  }) async {
    SchoolUserModel profilemodel = SchoolUserModel(
        childName: childName,
        chlildAddress: chlildAddress,
        schoolName: schoolName,
        schoollocation: schoollocation,
        phone: phone,
        email: email,
        name: name,
        profileImage: profileImage ?? model.profileImage,
        isUpdated: true,
        uId: uId);

    await FirebaseFirestore.instance
        .collection('parents')
        .doc(profilemodel.uId)
        .update(profilemodel.toMap())
        .then((value) {
      getUserData();
      emit(SchoolUserUpdateSuccessState());
    }).catchError((error) {
      SchoolUserUpdateErrorState();
    });
  }
}
/*   void updateUser({
    String image,
    String childName,
    String chlildAddress,
    String schoolName,
    String schoollocation,
    String phone,
  }) {
    emit(SchoolUserUpdateLoadinState());
    SchoolProfileModel userModel = SchoolProfileModel(
      childName: childName,
      chlildAddress: chlildAddress,
      schoolName: schoolName,
      schoollocation: schoollocation,
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uid)
        .update(userModel.toMap())
        .then((value) {
      getUserData();
      emit(SchoolUserUpdateSuccessState());
    }).catchError((error) {
      emit(SchoolUserUpdateSuccessState());
    });
  }

  void userProfile({
    @required String childName,
    @required String chlildAddress,
    @required String schoolName,
    @required String schoollocation,
    @required String phone,
    @required String image,
    @required String password,
    @required String email,
  }) {
    print('dma');
    emit(SchoolLoginLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user.email);
      print(value.user.uid);

      updateUser();
    }).catchError((error) {
      SchoolLoginERRORState(error.toString());
    });
  }
 */
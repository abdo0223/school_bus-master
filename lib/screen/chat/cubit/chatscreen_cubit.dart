import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:school_bus_za/helper/constants.dart';
import 'package:school_bus_za/model/school_user.dart';
import 'package:school_bus_za/screen/chat/chatmodel.dart';
import 'package:school_bus_za/shared/cash_helper.dart';
import 'package:school_bus_za/screen/chat/cubit/chatscreen_state.dart';

import 'chatscreen_state.dart';

class ChatCubit extends Cubit<SchoolState> {
  ChatCubit() : super(SchoolInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);

  SchoolUserModel userModel;
  void getUserData() {
    emit(SchoolLoadingState());
    uId = CacheHelper.getData(key: 'uId');
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = SchoolUserModel.fromjson(value.data());
      emit(SchoolGetUserSuccessState());
    }).catchError((onError) {
      emit(SchoolGetUserErrorState(onError.toString()));
    });
  }

  List<SchoolUserModel> users = [];
  void getUsers() {
    if (users.length == 0) emit(SchoolGetUsersLoadingState());
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if (element.data()['uId'] != userModel.uId)
          users.add(SchoolUserModel.fromjson(element.data()));
      });
      emit(SchoolGetUsersSuccessState());
    }).catchError((onError) {
      emit(SchoolGetUserErrorState(onError.toString()));
    });
  }

  void sendMessage({
    @required String receiverId,
    @required String dateTime,
    @required String text,
  }) {
    MessageModel model = MessageModel(
        text: text,
        senderId: userModel.uId,
        dateTime: dateTime,
        receiverId: receiverId);
    //Set My chats
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SchoolSendMessageSuccessState());
    }).catchError((error) {
      emit(SchoolSendMessageErrorState());
    });

    //SET receiver CHAT
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SchoolSendMessageSuccessState());
    }).catchError((error) {
      emit(SchoolSendMessageErrorState());
    });
  }

  List<SchoolChatModel> messages = [];

  void getMessages({
    @required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime') //عشان ارتب الرسايل واخر رساله تبقي تحت
        .snapshots() // عباره عن ستريم يعني بفتح ريل تايم
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(SchoolChatModel.fromJson(element.data()));
      });

      emit(SchoolGetMessagesSuccessState());
    });
  }

  void userRegister({
    @required String email,
    @required String password,
    @required String name,
  }) {
    print('dma');
    print(email);
    emit(SchoolRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user.email);
      print(value.user.uid);

      userCreate(name: name, email: email, uId: value.user.uid);
    }).catchError((error) {
      SchoolRegisterERRORState(error.toString());
    });
  }

  void userCreate({
    @required String email,
    @required String name,
    @required String uId,
  }) {
    SchoolUserModel registermodel =
        SchoolUserModel(uId: uId, name: name, email: email, isUpdated: false);
    FirebaseFirestore.instance
        .collection('users')
        .doc(registermodel.uId)
        .set(registermodel.toMap())
        .then((value) {
      emit(SchoolCreateSuccessState());
    }).catchError((error) {
      SchoolCreateERRORState(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SchoolRegisterChangePasswordVisibiltyState());
  }
}

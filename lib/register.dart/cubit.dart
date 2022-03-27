import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus/model/school_user.dart';
import 'package:school_bus/register.dart/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SchoolRegisterCubit extends Cubit<SchoolRegisterState> {
  SchoolRegisterCubit() : super(SchoolRegisterIntialState());

  static SchoolRegisterCubit get(context) =>
      BlocProvider.of(context, listen: false);

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

      userCreate(name: name, email: email, uid: value.user.uid);
    }).catchError((error) {
      SchoolRegisterERRORState(error.toString());
    });
  }

  void userCreate({
    @required String email,
    @required String name,
    @required String uid,
  }) {
    SchoolUserModel registermodel =
        SchoolUserModel(uid: uid, name: name, email: email, isUpdated: false);
    FirebaseFirestore.instance
        .collection('users')
        .doc(registermodel.uid)
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

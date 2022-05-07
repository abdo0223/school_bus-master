// ignore_for_file: must_be_immutable, deprecated_member_use


import 'package:conditional_builder/conditional_builder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_bus_za/functions/add_child_fun.dart';

import 'package:school_bus_za/helper/componanets.dart';

import 'package:school_bus_za/register.dart/state.dart';
import 'package:school_bus_za/school_bus/cubit/schoollogin_cubit.dart';
import 'package:school_bus_za/school_bus/cubit/schoollogin_state.dart';

import '../widget/login_widget_image_picker.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var childNameController = TextEditingController();

  var addressController = TextEditingController();

  var schoolNameController = TextEditingController();

  var phoneController = TextEditingController();

  var schoollAddressController = TextEditingController();

  var nameController = TextEditingController();

  final AddChildFun _addChildFun = AddChildFun();

  String path = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Color(0XFFFFAB4C),
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * .64,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 50),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 150),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "profile",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${nameController.text}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.height * .20,
                                  height: size.height * .17,
                                  child: Image.asset(
                                    "assets/image/idealogo3.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * .33),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(
                    children: [
                      Container(
                        height: size.height,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 20, left: 20),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        LoginWidgetImagePicker(function: () async{
                                          ImagePicker picker = ImagePicker();
                                          var image = await ImagePicker.pickImage(source:
                                          ImageSource.gallery);
                                          setState(() {path = image.path;});
                                        }, path: path),
                                        CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: IconButton(
                                              icon: Icon(
                                                Icons.linked_camera,
                                                size: 25,
                                                color: Color(0XFFFFAB4C),
                                              ),
                                              onPressed: () {
                                                SchoolLoginCubit.get(
                                                    context)
                                                    .getProfileImage();
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                          controller: childNameController,
                                          type: TextInputType.name,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'please enter your name address';
                                            }
                                          },
                                          label: 'child name',
                                          prefix: Icons.person,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                            controller: addressController,
                                            type: TextInputType.name,
                                            validate: (String value) {
                                              if (value.isEmpty) {
                                                return 'please enter your address';
                                              }
                                            },
                                            label: 'address',
                                            prefix: Icons.location_pin),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                          controller: phoneController,
                                          type: TextInputType.phone,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'please enter your phone address';
                                            }
                                          },
                                          label: 'Phone',
                                          prefix: Icons.phone,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                          controller:
                                          schoolNameController,
                                          type: TextInputType
                                              .visiblePassword,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'please enter your school name';
                                            }
                                          },
                                          label: 'school name',
                                          prefix: Icons.school_sharp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                          controller:
                                          schoollAddressController,
                                          type: TextInputType
                                              .visiblePassword,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'please enter your school address';
                                            }
                                          },
                                          label: 'school address',
                                          prefix: Icons.location_pin,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      defaultButton(
                                        function: () async{
                                          await _addChildFun.addChildFun(
                                              childName: childNameController.text,
                                              address: addressController.text,
                                              schoolName: schoolNameController.text,
                                              path: path, ctx: context);
                                        },
                                        text: 'save',
                                        isUpperCase: true,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

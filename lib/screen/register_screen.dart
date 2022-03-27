import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:school_bus/helper/componanets.dart';
import 'package:school_bus/register.dart/cubit.dart';
import 'package:school_bus/register.dart/state.dart';
import 'package:school_bus/school_bus/cubit/schoollogin_cubit.dart';
import 'package:school_bus/school_bus/cubit/schoollogin_state.dart';
import 'package:school_bus/screen/cubit/profile_screen.dart';
import 'package:school_bus/screen/login.dart';

class SchoolRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();

  var emailController = TextEditingController();
  var confirmPassword = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SchoolLoginCubit(),
      child: BlocConsumer<SchoolLoginCubit, SchoolLoginState>(
        listener: (context, state) {
          if (state is SchoolCreateSuccessState) {
            navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: size.height,
                width: size.width,
                color: Color(0XFFFFAB4C),
                child: Form(
                  key: formKey,
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height * .64,
                            width: size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 50),
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
                                            Text(
                                              "Register",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40,
                                              ),
                                            ),
                                            Text(
                                              "Create Your New Account",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: size.height * .20,
                                            height: size.height * .28,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: new AssetImage(
                                                      "assets/image/idealogo3.png"),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * .36),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, right: 20, left: 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      defaultFormField(
                                        controller: nameController,
                                        type: TextInputType.name,
                                        validate: (String value) {
                                          if (value.isEmpty) {
                                            return 'please enter your name address';
                                          }
                                        },
                                        label: 'username',
                                        prefix: Icons.person,
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      defaultFormField(
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        validate: (String value) {
                                          if (value.isEmpty) {
                                            return 'please enter your email address';
                                          }
                                        },
                                        label: 'Email Address',
                                        prefix: Icons.email_outlined,
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      defaultFormField(
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        validate: (String value) {
                                          if (value.isEmpty) {
                                            return 'please enter your password address';
                                          }
                                        },
                                        label: 'Password',
                                        prefix: Icons.lock,
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      defaultFormField(
                                        controller: confirmPassword,
                                        type: TextInputType.phone,
                                        validate: (String value) {
                                          if (value.isEmpty) {
                                            return 'please enter your password again';
                                          }
                                          if (value != passwordController.text)
                                            return 'Not Match';
                                          return null;
                                        },
                                        label: 'confirmPassword',
                                        prefix: Icons.phone,
                                      ),
                                      SizedBox(
                                        height: 7.0,
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      ConditionalBuilder(
                                        condition: state
                                            is! SchoolRegisterLoadingState,
                                        builder: (context) => defaultButton(
                                          function: () {
                                            if (formKey.currentState
                                                .validate()) {
                                              if (state
                                                  is SchoolCreateSuccessState) {
                                                navigateAndFinish(
                                                    context, HomeScreen());
                                              }
                                              SchoolRegisterCubit.get(context)
                                                  .userRegister(
                                                email: emailController.text,
                                                name: nameController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                            }
                                          },
                                          text: 'Create Account ',
                                          isUpperCase: true,
                                        ),
                                        fallback: (context) => Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "If you have an acount  ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          SchoolLoginScreen()));
                                            },
                                            child: Column(
                                              children: [
                                                Text(
                                                  "LOGIN.",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0XFFFFAB4C),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "OR",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      SignInButton(
                                        Buttons.Google,
                                        onPressed: () {
                                          _showButtonPressDialog(
                                              context, 'Google');
                                        },
                                      ),
                                    ],
                                  ),
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
            ),
          );
        },
      ),
    );
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: Duration(milliseconds: 400),
    ));
  }
}

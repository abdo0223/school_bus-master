import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_bus/helper/componanets.dart';
import 'package:school_bus/school_bus/cubit/schoollogin_cubit.dart';
import 'package:school_bus/school_bus/cubit/schoollogin_state.dart';
import 'package:school_bus/screen/chat/chatyser.dart';
import 'package:school_bus/screen/cubit/profile_screen.dart';
import 'package:school_bus/screen/register_screen.dart';
import 'package:school_bus/shared/cash_helper.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SchoolLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SchoolLoginCubit(),
      child: BlocConsumer<SchoolLoginCubit, SchoolLoginState>(
        listener: (context, state) {
          if (state is SchoolLoginSuccessState) {
            showToast(text: state.toString(), state: ToastStates.ERROR);
          }
          if (state is SchoolLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
            });
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 40),
                                        width: size.height * .27,
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hello Parent!",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                        ),
                                      ),
                                      Text(
                                        "Sign in To continue",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * .46),
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
                                padding:
                                    const EdgeInsets.only(top: 40, left: 20),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: defaultFormField(
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
                                    ),
                                    SizedBox(
                                      height: size.height * .02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: defaultFormField(
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        suffix: SchoolLoginCubit.get(context)
                                            .suffix,
                                        onSubmit: (value) {
                                          if (formKey.currentState.validate()) {
                                            SchoolLoginCubit.get(context)
                                                .userLogin(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            );
                                          }
                                        },
                                        isObsecured:
                                            SchoolLoginCubit.get(context)
                                                .isPassword,
                                        suffixPressed: () {
                                          SchoolLoginCubit.get(context)
                                              .changePasswordVisibility();
                                        },
                                        validate: (String value) {
                                          if (value.isEmpty) {
                                            return 'password is too short';
                                          }
                                        },
                                        label: 'Password',
                                        prefix: Icons.lock_outline,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 28),
                                      child: ConditionalBuilder(
                                        condition:
                                            state is! SchoolLoginLoadingState,
                                        builder: (context) => defaultButton(
                                          function: () {
                                            if (state
                                                is SchoolLoginSuccessState) {
                                              navigateAndFinish(
                                                  context, ChatsScreen());
                                            }
                                            if (formKey.currentState
                                                .validate()) {
                                              SchoolLoginCubit.get(context)
                                                  .userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                            }
                                          },
                                          text: 'login',
                                          isUpperCase: true,
                                        ),
                                        fallback: (context) => Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Don\'t have an account?',
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            SchoolRegisterScreen()));
                                              },
                                              child: Text(
                                                "SIGN UP",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0XFFFFAB4C),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
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

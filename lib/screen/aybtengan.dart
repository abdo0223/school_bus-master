/* import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:school_bus/helper/componanets.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({
    Key key,
  }) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * .65,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'School',
                          style: TextStyle(
                                  fontSize: 80,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none)
                              .copyWith(color: Color(0XFFFFAB4C)),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bus',
                                style: TextStyle(
                                        fontSize: 70,
                                        height: .8,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none)
                                    .copyWith(color: Color(0XFFFFAB4C))),
                            Container(
                              padding: EdgeInsets.only(left: 40),
                              width: size.height * .27,
                              height: size.height * .28,
                              child: Image.asset(
                                "assets/image/busw.jpg",
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * .5),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    Container(
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Color(0XFFFFAB4C),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 20),
                      child: Column(
                        children: [
                          Text(
                            'This is a mobile application that controls parents with their children school transport system, enabling them to locate their children and school bus at any given moment during the school bus route',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          SizedBox(
                            height: size.height * .088,
                          ),
                          defaultButton(
                              background: Colors.white,
                              function: () {},
                              text: 'Get Started')
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
    );
  }
}
 */
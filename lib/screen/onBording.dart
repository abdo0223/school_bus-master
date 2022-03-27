import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoaarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: .65,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 50),
        child: Row(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'School',
                      style: TextStyle(
                              fontSize: 80,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none)
                          .copyWith(color: Colors.orange),
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
                                .copyWith(color: Colors.orange)),
                        Container(
                          padding: EdgeInsets.only(left: 40),
                          width: 250.0,
                          height: 250.0,
                          child: Image.asset(
                            "assets/image/bus.jpg",
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

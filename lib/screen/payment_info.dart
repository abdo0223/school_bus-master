import 'package:flutter/material.dart';


import 'select_plan_screen.dart';


class PaymentInfo extends StatefulWidget {
  final String choice;
  final int price;

  const PaymentInfo({Key key, this.choice, this.price}) : super(key: key);
  @override
  _PaymentInfoState createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  bool rememberMe=false;
  int val=-1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SelectPlanScreen()),
                        );
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Payment Info',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                    width: 650.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Color(0XFFF0F2F3),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 600.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color:  Color(0XFFFFAB4C).withOpacity(0.57),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child:Row(
                              children: [
                                Icon(Icons.error,
                                  color: Colors.white,
                                ),
                                Text('Verify the information before proceeding',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.choice
                              ),
                              Text(widget.price.toString()+" LE",
                                style:
                                TextStyle(
                                  color: Color(0XFFFFAB4C),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tax'
                              ),
                              Text('4 LE',style:
                              TextStyle(
                                color: Color(0XFFFFAB4C),
                              ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Divider(
                            color: Colors.black,
                            height: 1.5,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('subtotal'
                              ),
                              Text((widget.price+4).toString(),style:
                              TextStyle(
                                color: Color(0XFFFFAB4C),
                              ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 650.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    color: Color(0XFFFFAB4C),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 190,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0XFF000000),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Text('Card number',style:
                                  TextStyle(color: Colors.orange),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 30.0,
                                      child: TextField(
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 14.0),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all((Radius.circular(5))),
                                          ),
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0XFF000000),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Text('Expires',style:
                                  TextStyle(color: Colors.orange),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 30.0,
                                      child: TextField(
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 17.0),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: 'MM/YY',
                                          hintStyle: TextStyle(
                                            color: Colors.black.withOpacity(0.5),
                                            fontSize: 15.0,
                                          ),
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all((Radius.circular(5))),
                                          ),
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                        SizedBox(height:20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 190,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0XFF000000),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Text('Name',style:
                                  TextStyle(color: Colors.orange),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 30.0,
                                      child: TextField(
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 14.0),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all((Radius.circular(5))),
                                          ),
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color(0XFF000000),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  Text('CVC',style:
                                  TextStyle(color: Colors.orange),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 30.0,
                                      child: TextField(
                                        maxLines: 1,
                                        style: TextStyle(fontSize: 17.0),
                                        textAlignVertical: TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          hintText: '000',
                                          hintStyle: TextStyle(
                                            color: Colors.black.withOpacity(0.5),
                                            fontSize: 15.0,
                                          ),
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all((Radius.circular(5))),
                                          ),
                                          fillColor: Colors.white,
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width * 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ],
                    ),

                  ),


                ),
                SizedBox(height: 5.0),
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value;
                        });
                      },
                      checkColor: Color(0XFFFFAB4C),
                      activeColor: Colors.grey,
                    ),
                    Text('Remember this card',
                      style: TextStyle(
                        color: Color(0XFFFFAB4C),
                      ),),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 50.0,
                      width: 200.0,
                      child: MaterialButton(onPressed:() {},
                        child: Text('Pay & Proceed',style:
                        TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0XFFFFAB4C),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
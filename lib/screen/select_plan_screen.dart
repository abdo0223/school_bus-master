import 'package:flutter/material.dart';
import 'package:school_bus_za/screen/payment_info.dart';


class SelectPlanScreen extends StatefulWidget {
  @override
  _SelectPlanScreenState createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  String radioValue;
  String choice;
  void radioButtonChanges(String value) {
    setState(() {
      radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        case 'three':
          choice = value;
          break;
        default:
          choice = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a Plan',
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                'select the offer that best suits your needs',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 500,
                height: 100,
                decoration: BoxDecoration(
                  color: radioValue == 'one'
                      ? Color(0XFFFFAB4C).withOpacity(0.57)
                      : Color(0XFFF0F2F3),
                  border: Border.all(color: Color(0XFFFFAB4C)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: 'one',
                        groupValue: radioValue,
                        onChanged: radioButtonChanges,
                        activeColor: Color(0XFFFFAB4C),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Basic',
                            style: TextStyle(
                              color: radioValue == 'one'
                                  ? Color(0XFFFFAB4C)
                                  : Color(0XFF000000),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Economic Plan',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Text(
                        '100 LE/m ',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0XFFFFAB4C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 500,
                height: 100,
                decoration: BoxDecoration(
                  color: radioValue == 'two'
                      ? Color(0XFFFFAB4C).withOpacity(0.57)
                      : Color(0XFFF0F2F3),
                  border: Border.all(color: Color(0XFFFFAB4C)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: 'two',
                        groupValue: radioValue,
                        onChanged: radioButtonChanges,
                        activeColor: Color(0XFFFFAB4C),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Professional Plan',
                            style: TextStyle(
                              color: radioValue == 'two'
                                  ? Color(0XFFFFAB4C)
                                  : Color(0XFF000000),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Economic Plan',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Text(
                        '150 LE/m ',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0XFFFFAB4C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 500,
                height: 100,
                decoration: BoxDecoration(
                  color: radioValue == 'three'
                      ? Color(0XFFFFAB4C).withOpacity(0.57)
                      : Color(0XFFF0F2F3),
                  border: Border.all(color: Color(0XFFFFAB4C)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Radio(
                        value: 'three',
                        groupValue: radioValue,
                        onChanged: radioButtonChanges,
                        activeColor: Color(0XFFFFAB4C),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Diamond Plan',
                            style: TextStyle(
                              color: radioValue == 'three'
                                  ? Color(0XFFFFAB4C)
                                  : Color(0XFF000000),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Economic Plan',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Text(
                        '200 LE/m ',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color(0XFFFFAB4C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 50.0,
                    width: 100.0,
                    child: MaterialButton(onPressed:()
                    {
                      if(choice=='one'){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (BuildContext context)=>PaymentInfo(choice:"Basic",price: 100))
                        );
                      }else if(choice=='two'){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (BuildContext context)=>PaymentInfo(choice: "Professional Plan",price: 150)),
                        );
                      }else if(choice=='three'){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (BuildContext context)=>PaymentInfo(choice: "Diamond Plan",price: 200))
                        );
                      }else{
                        print('Please select a choice');
                      }
                    },
                      child: Text('Confirm',style:
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
    );
  }
}
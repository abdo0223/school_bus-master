import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool val1 = true;
  bool val2 = false;
  bool val3 = false;
  bool val4 = false;
  onChangeFunction1(bool newValue1) {
    setState(() {
      val1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      val2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      val3 = newValue3;
    });
  }

  onChangeFunction4(bool newValue4) {
    setState(() {
      val4 = newValue4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  leading: Icon(Icons.menu, color: Colors.white),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location settings',
                      style: TextStyle(
                        color: Color(0XFF0728ff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Set Pickup Drop-off location',
                      style: TextStyle(
                        color: Color(0XFF0728ff),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.home),
                        Text(
                          '53 othman Ebn Affan st. Saffir',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          'As Salam School',
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      height: 1, width: double.infinity,
                      color: Color(0XFFFFAB4C),
                      //margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Notifications settings',
                      style: TextStyle(
                        color: Color(0XFF0728ff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    customSwitch(
                        'when bus arrived at School', val1, onChangeFunction1),
                    customSwitch(
                        'when bus left School', val2, onChangeFunction2),
                    customSwitch('when bus arrived at your Home', val3,
                        onChangeFunction3),
                    customSwitch(
                        'when bus Left your home', val4, onChangeFunction4),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customSwitch(String text, bool val, Function onChangedMethod) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          // Spacer(),
          CupertinoSwitch(
            trackColor: Colors.grey,
            activeColor: Colors.blue,
            value: val,
            onChanged: (newValue) {
              onChangedMethod(newValue);
            },
          ),
        ],
      ),
    );
  }
}

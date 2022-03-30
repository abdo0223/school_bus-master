import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreeen extends StatefulWidget {
  const SettingScreeen({Key key}) : super(key: key);

  @override
  State<SettingScreeen> createState() => _SettingScreeenState();
}

class _SettingScreeenState extends State<SettingScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(
        "SettingScreeen",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

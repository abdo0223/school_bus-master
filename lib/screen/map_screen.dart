import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(
        "Contact Us",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

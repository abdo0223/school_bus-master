import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_bus/widget/info_driver_inMap.dart';
import 'package:school_bus/widget/location_helper.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static Position position;
  static final CameraPosition _myCurrentLocation = CameraPosition(
    bearing: 0.0,
    target: LatLng(
      position.latitude,
      position.longitude,
    ),
    tilt: 0.0,
    zoom: 17,
  );

  Future<void> getMyCurrentLocation() async {
    await LocationHelper.getCurrentLocation();
    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  ////////////////////
  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _myCurrentLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_myCurrentLocation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          position != null
              ? buildMap()
              : Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                ),
          InfoDriver()
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 180),
        child: FloatingActionButton(
          //foregroundColor: Colors.black54,
          backgroundColor: Color(0XFFFFAB4C),
          onPressed: _goToMyCurrentLocation,
          child: Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

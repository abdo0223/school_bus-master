import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';






class FindBus extends StatefulWidget {

  const FindBus({Key key}) : super(key: key);


  @override
  State<FindBus> createState() => _FindBusState();
}

class _FindBusState extends State<FindBus> {

  List <Marker> myMarker = [];
  GoogleMapController mapController;
  double lat;
  double long;



  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async{
      print('LOOOL');
      await FirebaseFirestore.instance.collection('drivers').doc(
          'o6OU71joT5XjDalgogPRLbYrZl22').get().then((value) {
        setState(() {
          lat= double.parse(value.get('latitude'));
          long = double.parse(value.get('longitude'));
        });
      });

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          child: Icon(Icons.refresh),
          backgroundColor: Colors.black,
          onPressed: () async{
            await FirebaseFirestore.instance.collection('drivers').doc(
                'o6OU71joT5XjDalgogPRLbYrZl22').get().then((value) {
              setState(() {
                lat= double.parse(value.get('latitude'));
                long = double.parse(value.get('longitude'));
              });
            });
          },
        ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: PreferredSize(
          child: AppBar(),
          preferredSize: const Size.fromHeight(0),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GoogleMap(
                initialCameraPosition:CameraPosition(target: LatLng(lat, long), zoom: 16),
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController googleMapController) {
                  setState(() {
                    mapController = googleMapController;
                    myMarker.add(
                        Marker(
                          draggable: true,
                          markerId: MarkerId('$long'),
                          position: LatLng(lat, long),
                        ));
                  });
                },
                markers: Set.from(myMarker),
              ),
            ),

          ],
        )
    );
  }



}
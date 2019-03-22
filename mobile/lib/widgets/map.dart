import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  var location = Location();

  Completer<GoogleMapController> _controller = Completer();

  Future _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.730610, -73.935242),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(40.730610, 73.935242),
      tilt: 0,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToTheLake,
        child: Icon(Icons.my_location),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    LocationData currentLocation = await _getLocation();
    print(currentLocation.latitude);
    CameraPosition newPos = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        tilt: 0,
        zoom: 19.151926040649414);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(newPos));
  }
}

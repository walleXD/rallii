import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class QuestMap extends HookWidget {
  final Location _location = Location();
  final Completer<GoogleMapController> _controller = Completer();

  CameraPosition generateCameraPosition(double lat, double long, double zoom) =>
      CameraPosition(target: LatLng(lat, long), zoom: zoom);

  Widget _buildMap(CameraPosition camPos) => GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: camPos,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      );

  @override
  Widget build(BuildContext context) {
    final currentLocation = useFuture(_location.getLocation());
    CameraPosition camPos;

    if (currentLocation.hasData) {
      camPos = generateCameraPosition(
          currentLocation.data.latitude, currentLocation.data.longitude, 15.0);
    }

    return Scaffold(
        body: currentLocation.hasData ? _buildMap(camPos) : Text("Loading!"));
  }
}

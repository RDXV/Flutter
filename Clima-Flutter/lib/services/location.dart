// import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double longitude, latitude;
  // Position currentPosition;

  Future<void> getLocation() async {
    // try {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        locationPermissionLevel: GeolocationPermission.location);

    latitude = position.latitude;
    longitude = position.longitude;
    // print('The current latitude is $latitude');
    // print('The current longitude is $longitude');
    // print(position);
    // } catch (e) {
    //   print(e);
    // }
  }
}

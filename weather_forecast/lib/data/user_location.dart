import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class UserLocation {
  Future<(double latitude, double longitude)?> getCurrentLocation(
    BuildContext context,
  ) async {
    try {
      await Geolocator.requestPermission();

      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      return (position.latitude, position.longitude);
    } catch (e) {
      return null;
    }
  }
}

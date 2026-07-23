import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class MyLocation {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation(BuildContext context) async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("위치 정보수신에 문제가 생겼습니다.")));
    }
  }
}

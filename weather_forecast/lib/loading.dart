import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("현재 위치: $position")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("위치 정보수신에 문제가 생겼습니다.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: FilledButton(
          onPressed: _getLocation,
          child: Text("나의 현재 위치 가져오기"),
        ),
      ),
    );
  }
}

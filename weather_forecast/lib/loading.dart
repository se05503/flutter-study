import 'package:flutter/material.dart';
import 'package:weather_forecast/data/my_location.dart';
import 'package:weather_forecast/data/network.dart';
import 'package:weather_forecast/weather_screen.dart';

const String apiKey = "64e9384697d9721ee4eb181e4db51b8d";

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? longitude2;
  double? latitude2;

  void _getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation(context);
    longitude2 = myLocation.longitude;
    latitude2 = myLocation.latitude;
    Network network = Network(
      "https://api.openweathermap.org/data/2.5/weather?lat=$latitude2&lon=$longitude2&appid=$apiKey&units=metric",
    );
    var weatherData = await network.getJsonData();
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(weatherData: weatherData),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
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

import 'package:flutter/material.dart';
import 'package:weather_forecast/data/user_location.dart';
import 'package:weather_forecast/data/network.dart';
import 'package:weather_forecast/weather_screen.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void _getLocation() async {
    UserLocation myLocation = UserLocation();
    var result = await myLocation.getCurrentLocation(context);

    if (result == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("위치 정보수신에 문제가 생겼습니다.")));
      return;
    }

    var (latitude, longitude) = result;

    Network network = Network(
      "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric",
    );

    Map<String, dynamic>? weatherData = await network.getJsonData();
    if (weatherData == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("날씨 정보수신에 문제가 생겼습니다.")));
      return;
    }

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(weatherData: weatherData),
      ),
    );
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

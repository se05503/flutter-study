import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, this.weatherData});
  final dynamic weatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  double? cityTemp;

  void updateData(dynamic weatherData) {
    cityName = weatherData["name"];
    cityTemp = weatherData["main"]["temp"];
  }

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("도시: $cityName", style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            Text("기온: $cityTemp℃", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}

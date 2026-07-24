import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.weatherData});
  final Map<String, dynamic> weatherData;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  double? cityTemp;
  String? weatherIconId;

  void updateData(dynamic weatherData) {
    cityName = weatherData["name"];
    cityTemp = weatherData["main"]["temp"];
    weatherIconId = weatherData["weather"][0]["icon"];
  }

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$cityName",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "$cityTemp\u2103",
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            weatherIconId != null
                ? Image.network(
                    "https://openweathermap.org/payload/api/media/file/$weatherIconId.png",
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

import 'package:dinosaur_card/info.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.name,
    required this.period,
    required this.taste,
    required this.length,
    required this.weight,
    required this.description,
    required this.imagePath,
    required this.color,
  });

  final String name;
  final String period;
  final String taste;
  final String length;
  final String weight;
  final String description;
  final String imagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: color,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: color,
            width: double.infinity,
            height: 200,
            child: Center(child: Image.asset(imagePath, width: 120)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Info(title: "시대", content: period),
                Info(title: "식성", content: taste),
                Info(title: "길이", content: length),
                Info(title: "무게", content: weight),
                SizedBox(height: 20),
                Text(
                  "설명",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

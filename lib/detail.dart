import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail page"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 200,
            child: Center(child: Image.asset("images/di1.png", width: 120)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "시대",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text("백악기 후기 (6800만년 전)"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "식성",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text("육식"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "길이",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text("12-15m"),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "체중",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 40),
                    Text("7톤"),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "설명",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "T-Rex는 가장 잘 알려진 공룡 중 하나로, "
                  "강력한 턱과 날카로운 이빨을 가진 포식자였습니다...",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

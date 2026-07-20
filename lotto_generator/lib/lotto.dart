import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lotto_generator/lotto_ball.dart';

class Lotto extends StatefulWidget {
  const Lotto({super.key});

  @override
  State<Lotto> createState() => _LottoState();
}

class _LottoState extends State<Lotto> {
  List<List<int>> lottoList = [];

  void createNumber() {
    List<int> lottoNumber = [];
    while (true) {
      int randomNumber = Random().nextInt(45) + 1;
      if (!lottoNumber.contains(randomNumber)) lottoNumber.add(randomNumber);
      if (lottoNumber.length == 6) break;
    }
    lottoNumber.sort();
    setState(() {
      lottoList.add(lottoNumber); // A,B,C,D,E 총 5번 추가하기
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Lotto app"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                children: [
                  LottoBall(path: "svg/${lottoList[index][0]}.svg"),
                  SizedBox(width: 4),
                  LottoBall(path: "svg/${lottoList[index][1]}.svg"),
                  SizedBox(width: 4),
                  LottoBall(path: "svg/${lottoList[index][2]}.svg"),
                  SizedBox(width: 4),
                  LottoBall(path: "svg/${lottoList[index][3]}.svg"),
                  SizedBox(width: 4),
                  LottoBall(path: "svg/${lottoList[index][4]}.svg"),
                  SizedBox(width: 4),
                  LottoBall(path: "svg/${lottoList[index][5]}.svg"),
                ],
              );
            },
            itemCount: lottoList.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNumber,
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

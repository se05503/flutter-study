import 'package:flutter/material.dart';
import 'dart:math';

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
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Text(lottoList[index].toString());
            },
            separatorBuilder: (context, index) {
              return Divider(color: Colors.black, thickness: 0.5);
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

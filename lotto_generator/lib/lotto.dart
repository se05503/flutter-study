import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
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
    if (lottoList.length < 5) {
      List<int> lottoNumber = [];
      while (true) {
        int randomNumber = Random().nextInt(45) + 1;
        if (!lottoNumber.contains(randomNumber)) lottoNumber.add(randomNumber);
        if (lottoNumber.length == 6) break;
      }
      lottoNumber.sort();
      setState(() {
        lottoList.add(lottoNumber);
      });
    } else {
      Fluttertoast.showToast(
        msg: "5번(A,B,C,D,E)까지만 생성 가능합니다.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.lightGreen,
        textColor: Colors.white,
      );
    }
  }

  void showNumbers(BuildContext context, int drawNumber, List<int> lottoList) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 320,
            padding: EdgeInsetsGeometry.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  "$drawNumber번째 추첨번호",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "$lottoList",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Lottie.asset("lottie/lotto_ball.json"),
                ),
                SizedBox(height: 36),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(fixedSize: Size(200, 50)),
                  child: Text(
                    "닫기",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    int drawNumber = index + 1;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: ListTile(
                        title: Text(
                          "$drawNumber번째 추첨번호",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Row(
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
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showNumbers(context, drawNumber, lottoList[index]);
                          },
                          icon: Icon(
                            Icons.summarize,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: lottoList.length,
                ),
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Lottie.asset("lottie/lotto_ball.json"),
              ),
            ],
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

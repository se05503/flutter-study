import 'package:flutter/material.dart';
import 'package:lotto_generator/lotto_history/lotto_data.dart';

class LottoNumber extends StatefulWidget {
  const LottoNumber({super.key});

  @override
  State<LottoNumber> createState() => _LottoNumberState();
}

class _LottoNumberState extends State<LottoNumber> {
  final TextEditingController controller = TextEditingController();
  Future<LottoResult>? lottoResult;

  void fetchNewRound(int selectedRount) {
    lottoResult = fetchLottoResult(selectedRount);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("로또 당첨번호 조회"), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: "회차 번호 입력",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final inputText = controller.text;
                    final selectedRound = int.tryParse(inputText);
                    if (selectedRound != null) {
                      fetchNewRound(selectedRound);
                    } else {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("숫자를 입력해주세요!")));
                    }
                  },
                  child: Text("조회"),
                ),
              ],
            ),
          ),
          FutureBuilder<LottoResult>(
            future: lottoResult,
            builder: (context, snapshot) {
              if (lottoResult == null) {
                return Center(child: Text("조회할 회차를 입력해주세요"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("데이터를 불러오지 못했습니다."));
              } else if (snapshot.hasData) {
                final result = snapshot.data!;
                return Column(
                  children: [
                    Text(
                      "회차: ${result.drwNo}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "추첨일: ${result.drwNoDate}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        _lottoBall(result.drwtNo1),
                        _lottoBall(result.drwtNo2),
                        _lottoBall(result.drwtNo3),
                        _lottoBall(result.drwtNo4),
                        _lottoBall(result.drwtNo5),
                        _lottoBall(result.drwtNo6),
                      ],
                    ),
                    Text(
                      "보너스 번호",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    _lottoBall(result.bnusNo, isBonus: true),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget _lottoBall(int number, {bool isBonus = false}) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: isBonus ? Colors.green : Colors.orange,
      shape: BoxShape.circle,
    ),
    // alignment: Alignment.center,
    child: Text("$number", style: TextStyle(color: Colors.white, fontSize: 12)),
  );
}

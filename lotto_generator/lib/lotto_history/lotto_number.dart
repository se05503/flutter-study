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
  int? latestRound;

  void fetchNewRound(int selectedRount) {
    setState(() {
      lottoResult = fetchLottoResult(selectedRount);
    });
    controller.clear();
  }

  void _loadLatestRound() async {
    final firstDraw = DateTime(2002, 12, 7); // 1회차 날짜
    final now = DateTime.now();
    final estimated = now.difference(firstDraw).inDays ~/ 7 + 1;
    try {
      await fetchLottoResult(estimated);
      setState(() => latestRound = estimated);
    } catch (_) {
      setState(() => latestRound = estimated - 1);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadLatestRound(); // 최신 회차 정보 불러오기
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
                      hintText: latestRound != null
                          ? "가장 최근 회차: $latestRound회차"
                          : "불러오는 중...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final inputText = controller.text;
                    final selectedRound = int.tryParse(inputText);

                    if (selectedRound != null &&
                        selectedRound >= 1 &&
                        selectedRound <= latestRound!) {
                      fetchNewRound(selectedRound);
                    } else if (selectedRound != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("1 ~ $latestRound 사이의 회차를 입력해주세요!"),
                        ),
                      );
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
          SizedBox(height: 12),
          FutureBuilder<LottoResult>(
            future: lottoResult,
            builder: (context, snapshot) {
              if (lottoResult == null) {
                return Center(child: Text("조회할 회차를 입력해주세요"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print("에러 내용: ${snapshot.error}");
                return Center(child: Text("데이터를 불러오지 못했습니다."));
              } else if (snapshot.hasData) {
                final result = snapshot.data!;
                print("받아온 데이터: ${result.toString()}");
                return Column(
                  children: [
                    Text(
                      "회차: ${result.ltEpsd}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "추첨일: ${result.ltRflYmd.substring(0, 4)}.${result.ltRflYmd.substring(4, 6)}.${result.ltRflYmd.substring(6, 8)}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _lottoBall(result.tm1WnNo),
                        _lottoBall(result.tm2WnNo),
                        _lottoBall(result.tm3WnNo),
                        _lottoBall(result.tm4WnNo),
                        _lottoBall(result.tm5WnNo),
                        _lottoBall(result.tm6WnNo),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "보너스 번호",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    _lottoBall(result.bnsWnNo, isBonus: true),
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
    child: Center(
      child: Text(
        "$number",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  );
}

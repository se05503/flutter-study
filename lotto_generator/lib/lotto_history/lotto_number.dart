import 'package:flutter/material.dart';

class LottoNumber extends StatefulWidget {
  const LottoNumber({super.key});

  @override
  State<LottoNumber> createState() => _LottoNumberState();
}

class _LottoNumberState extends State<LottoNumber> {
  final TextEditingController controller = TextEditingController();
  int selectedRound = -1;

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
                    final parseRound = int.tryParse(inputText);
                    if (parseRound != null) {
                      setState(() {
                        selectedRound = parseRound;
                      });
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
        ],
      ),
    );
  }
}

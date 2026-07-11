import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int diceNumber = 1;
  int diceNumber2 = 1;

  void rollingDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      diceNumber2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice game app"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: rollingDice,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset("images/dice$diceNumber.png", width: 200),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Image.asset("images/dice$diceNumber2.png", width: 200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

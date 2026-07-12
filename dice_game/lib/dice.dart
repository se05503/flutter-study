import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Dice extends StatefulWidget {
  const Dice({super.key});

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int diceNumber = 1;
  int diceNumber2 = 1;
  bool isRolling = false;
  final AudioPlayer player = AudioPlayer();

  void rollingDice() {
    if (isRolling) return;
    setState(() {
      isRolling = true;
    });
    player.play(AssetSource('dice_sound.wav'));
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        diceNumber = Random().nextInt(6) + 1;
        diceNumber2 = Random().nextInt(6) + 1;
        isRolling = false;
      });
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
            child: isRolling
                ? Lottie.asset("lottie/rolling_dice.json", width: 300)
                : Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "images/dice$diceNumber.png",
                          width: 200,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Image.asset(
                          "images/dice$diceNumber2.png",
                          width: 200,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

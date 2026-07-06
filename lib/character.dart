import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  const Character({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("DINOSAUR CARD", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 120, 77, 4),
      ),
      body: Column(
        children: [
          Image.asset("images/di1.png", height: 152),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Container(width: 115, height: 2, color: Colors.deepPurple),
          ),
          Text("Tyrannosaurus rex", style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

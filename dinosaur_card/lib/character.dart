import 'package:dinosaur_card/detail.dart';
import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  const Character({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
      appBar: AppBar(
        title: Text("DINOSAUR CARD", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 120, 77, 4),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                name: 'Tyrannosaurus Rex',
                                period: '백악기 후기 (6800만년 전)',
                                taste: '육식',
                                length: '12-15m',
                                weight: '7톤',
                                color: Colors.green,
                                description:
                                    'T-Rex는 가장 잘 알려진 공룡 중 하나로, 강력한 턱과 날카로운 이빨을 가진 포식자였습니다.',
                                imagePath: "images/di1.png",
                              ),
                            ),
                          );
                        },
                        child: Image.asset(
                          "images/di1.png",
                          width: 152,
                          height: 152,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text("Tyrannosaurus rex", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                name: 'Brachiosaurus',
                                period: '쥐라기 후기 (약 1억 5400만년 전)',
                                taste: '초식',
                                length: '22-30m',
                                weight: '약 56톤',
                                color: Colors.blueGrey,
                                description:
                                    'Brachiosaurus는 그 이름이 "팔이 긴 도마뱀"을 의미하는 초식 공룡으로, 그의 긴 목과 크기로 유명합니다. 그들은 그들의 앞다리가 뒷다리보다 길어서 높은 나무의 잎을 먹을 수 있었습니다.',
                                imagePath: "images/di2.png",
                              ),
                            ),
                          );
                        },
                        child: Image.asset("images/di2.png", height: 152),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text("Brachiosaurus", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                name: 'Triceratops',
                                period: '백악기 후기 (6800만년 전)',
                                taste: '초식',
                                length: '9m',
                                weight: '약 6-12톤',
                                color: const Color.fromARGB(255, 132, 79, 33),
                                description:
                                    'Triceratops는 세 개의 뿔과 큰 목 보호대를 가진 머리가 특징인 공룡입니다. 이들은 그들의 뿔과 보호대를 포식자로부터 자신을 방어하는 데 사용했습니다.',
                                imagePath: "images/di3.png",
                              ),
                            ),
                          );
                        },
                        child: Image.asset("images/di3.png", height: 152),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text("Triceratops", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                name: 'Ankylosaurus',
                                period: '백악기 후기 (약 6600만년 전)',
                                taste: '초식',
                                length: '6-8m',
                                weight: '약 6톤',
                                color: const Color.fromARGB(255, 53, 112, 142),
                                description:
                                    'Ankylosaurus는 전신이 뼈로 된 갑옷으로 덮여 있는 공룡으로, 그들의 꼬리는 강력한 "몽둥이"처럼 사용될 수 있었습니다. 이 갑옷은 포식자로부터 보호하는 역할을 했습니다.',
                                imagePath: "images/di4.png",
                              ),
                            ),
                          );
                        },
                        child: Image.asset("images/di4.png", height: 152),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text("Ankylosaurus", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                name: 'Velociraptor',
                                period: '백악기 후기 (약 7500만년 전)',
                                taste: '육식',
                                length: '2-3m',
                                weight: '약 15-20kg',
                                color: const Color.fromARGB(255, 166, 98, 26),
                                description:
                                    'Velociraptor는 날렵한 몸매와 날카로운 발톱을 가진 소형 육식 공룡입니다. 그들은 매우 빠르게 움직일 수 있으며, 사냥감을 공격할 때 그들의 큰 발톱을 사용했습니다.',
                                imagePath: "images/di5.png",
                              ),
                            ),
                          );
                        },
                        child: Image.asset("images/di5.png", height: 152),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text("Velociraptor", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                name: 'Elasmosaurus',
                                period: '백악기 후기 (약 8000만년 전)',
                                taste: '육식',
                                length: '14m',
                                weight: '약 2톤',
                                color: const Color.fromARGB(255, 14, 111, 160),
                                description:
                                    'Elasmosaurus는 물속에서 생활하던 장수류 공룡으로, 특히 그 긴 목이 특징입니다. 이들은 작은 물고기나 다른 해양 동물들을 잡아먹으며 살았습니다.',
                                imagePath: "images/di6.png",
                              ),
                            ),
                          );
                        },
                        child: Image.asset("images/di6.png", height: 152),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Container(
                          width: 115,
                          height: 2,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text("Elasmosaurus", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage("images/codingchef3.png"),
                radius: 30,
                backgroundColor: Colors.amber[200],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

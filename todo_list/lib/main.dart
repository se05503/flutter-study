import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/todo_list.dart';

void main() async {
  await Hive.initFlutter(); // 각 플랫폼에 맞는 저장 경로를 지정해줌
  var box = await Hive.openBox("todoListBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoList(),
    );
  }
}

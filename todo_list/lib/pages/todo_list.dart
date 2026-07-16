import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/pages/task_tile.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List todoTask = [
    ["피아노치기", false],
    ["영화보기", false],
    ["공부하기", false],
    ["독서하기", false],
  ];

  void checkBoxTapped(int index) {
    setState(() {
      todoTask[index][1] = !todoTask[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: Text("할일 목록 앱"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todoTask.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskName: todoTask[index][0],
            isCompleted: todoTask[index][1],
            onChanged: (isChecked) => checkBoxTapped(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

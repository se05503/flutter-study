import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/pages/task_tile.dart';
import 'package:todo/widget/task_box.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _controller = TextEditingController();

  List todoTask = [];

  void checkBoxTapped(int index) {
    setState(() {
      todoTask[index][1] = !todoTask[index][1];
    });
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TaskBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  void saveTask() {
    setState(() {
      todoTask.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.pop(context);
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
        onPressed: addNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}

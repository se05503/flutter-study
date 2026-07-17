import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/constants.dart';
import 'package:todo/database/hive_database.dart';
import 'package:todo/pages/task_tile.dart';
import 'package:todo/widget/task_box.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  HiveDatabase db = HiveDatabase();
  final _dataBox = Hive.box(AppConstants.dbName);
  final _controller = TextEditingController();

  void checkBoxTapped(int index) {
    setState(() {
      db.todoTask[index][1] = !db.todoTask[index][1];
    });
    db.updateData();
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
      db.todoTask.add([_controller.text, false]);
    });
    _controller.clear();
    db.updateData();
    Navigator.pop(context);
  }

  void deleteTask(int index) {
    setState(() {
      db.todoTask.removeAt(index);
    });
    db.updateData();
  }

  @override
  void initState() {
    if (_dataBox.get(AppConstants.dbTodoKey) == null) {
      db.initData();
    } else {
      db.readData();
    }
    super.initState();
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
        itemCount: db.todoTask.length,
        itemBuilder: (context, index) {
          return TaskTile(
            key: Key(index.toString()),
            taskName: db.todoTask[index][0],
            isCompleted: db.todoTask[index][1],
            onChanged: (isChecked) => checkBoxTapped(index),
            onDelete: (context) => deleteTask(index),
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

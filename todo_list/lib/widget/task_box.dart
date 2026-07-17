import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/widget/mybutton.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 360,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              controller: controller,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Mybutton(onPressed: onSave, buttonName: "저장하기"),
                SizedBox(width: 20),
                Mybutton(onPressed: onCancel, buttonName: "취소하기"),
              ],
            ),
            SizedBox(height: 40),
            Lottie.asset("lib/lottie/calendar.json", width: 300),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

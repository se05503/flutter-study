import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/widget/mybutton.dart';

class TaskBox extends StatefulWidget {
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
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  DateTime? _selectedDateTime; // 사용자가 날짜와 시간을 선택하지 않을 수 있으므로 nullable로 선언

  Future<void> selectDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(2026),
      lastDate: DateTime(2027),
    );

    print("pickedDate: $pickedDate");

    if (pickedDate != null) {
      // 사용자가 cancel 버튼을 누르지 않고 날짜(년/월/일)를 선택해서 확인 버튼을 누른 경우
      // 예) pickedDate = 2026-07-18 00:00:00.000
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedDateTime != null
            ? TimeOfDay.fromDateTime(_selectedDateTime!)
            : TimeOfDay.now(),
      );

      print("pickedTime: $pickedTime");

      if (pickedTime != null) {
        // 유저가 날짜와 시간을 둘 다 선택한 경우
        final DateTime combined = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        setState(() {
          _selectedDateTime = combined;
        });
      }
    }
  }

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
              controller: widget.controller,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Mybutton(onPressed: widget.onSave, buttonName: "저장하기"),
                SizedBox(width: 20),
                Mybutton(onPressed: widget.onCancel, buttonName: "취소하기"),
              ],
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: selectDateTime,
              child: Lottie.asset("lib/lottie/calendar.json", width: 300),
            ),
            Text(
              _selectedDateTime != null
                  ? DateFormat(
                      "yyyy년 MM월 dd일 HH시 mm분",
                    ).format(_selectedDateTime!)
                  : "날짜를 설정해주세요",
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

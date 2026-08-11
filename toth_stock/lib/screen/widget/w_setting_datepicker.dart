import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SettingDatePicker extends StatelessWidget {
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;

  const SettingDatePicker({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            "날짜 설정",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Expanded(child: Spacer()),
          GestureDetector(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now().subtract(30.days),
                lastDate: DateTime.now().add(30.days),
              );
              if (date != null) {
                onChanged(date);
              }
            },
            child: Text(
              value != null
                  ? DateFormat("yyyy년 MM월 dd일").format(value!)
                  : "날짜를 선택해주세요",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

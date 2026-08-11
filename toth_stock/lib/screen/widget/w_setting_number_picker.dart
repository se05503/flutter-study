import 'package:flutter/material.dart';
import 'package:toth_stock/screen/dialog/setting_dialog.dart';

class SettingNumberPicker extends StatelessWidget {
  final int? value;
  final ValueChanged<int> onChanged;

  const SettingNumberPicker({
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
            "숫자 설정",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Expanded(child: Spacer()),
          GestureDetector(
            onTap: () async {
              final int result = await showDialog(
                context: context,
                builder: (context) {
                  return SettingDialog();
                },
              );
              onChanged(result);
            },
            child: Text(value != null ? value.toString() : "숫자를 선택해주세요",
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

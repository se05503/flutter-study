import 'package:flutter/material.dart';

import '../../common/color/colors.dart';

class SettingDialog extends StatefulWidget {
  const SettingDialog({super.key});

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AbstractThemeColors.roundedLayoutBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("숫자를 입력해주세요", style: TextStyle(color: Colors.white)),
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.white, fontSize: 16),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                if (controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("숫자를 입력해주세요!"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  return;
                };
                int number = int.parse(controller.text);
                Navigator.pop(context, number);
              },
              child: Text("저장하기"),
            ),
          ],
        ),
      ),
    );
  }
}

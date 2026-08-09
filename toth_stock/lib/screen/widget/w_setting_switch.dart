import 'package:flutter/material.dart';
import 'package:toth_stock/screen/widget/w_os_switch.dart';

class SettingSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingSwitch({required this.value, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: Row(
        children: [
          Text("푸시 설정", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          Expanded(child: Spacer()),
          OsSwitch(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

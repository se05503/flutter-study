import 'package:flutter/material.dart';

class SettingSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const SettingSlider({required this.value, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: Row(
        children: [
          Text("밝기 조절", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          Expanded(child: Spacer()),
          Slider(value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}
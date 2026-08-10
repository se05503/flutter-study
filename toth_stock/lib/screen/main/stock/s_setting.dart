import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/screen/widget/w_setting_switch.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isToggleOn = false;
  final String _prefKey = "isPushNotificationSwitchOn";

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isToggleOn = prefs.getBool(_prefKey) ?? false;
    });
  }

  Future<void> _saveSettings(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AbstractThemeColors.roundedLayoutBackground,
      appBar: AppBar(
        backgroundColor: AbstractThemeColors.appBarBackground,
        foregroundColor: Colors.white,
        title: Text("설정"),
      ),
      body: ListView(
        children: [
          // switch
          SettingSwitch(
            value: isToggleOn,
            onChanged: (value) {
              setState(() {
                isToggleOn = value;
              });
              _saveSettings(value);
            },
          ),
        ],
      ),
    );
  }
}

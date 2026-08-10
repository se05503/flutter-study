import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  static const String _prefPushNotificationKey = "isPushNotificationSwitchOn";
  static const String _prefScreenBrightnessKey = "screenBrightness";

  final RxBool isPushNotificationOn = false.obs;
  final RxDouble screenBrightness = 0.5.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    isPushNotificationOn.value =
        prefs.getBool(_prefPushNotificationKey) ?? false;
    screenBrightness.value = prefs.getDouble(_prefScreenBrightnessKey) ?? 0.5;
    try {
      await ScreenBrightness().setApplicationScreenBrightness(
        screenBrightness.value,
      );
      debugPrint("밝기 변경 성공: ${screenBrightness.value}");
    } catch (e) {
      debugPrint("밝기 변경 실패: $e");
    }
  }

  Future<void> togglePushNotification(bool value) async {
    isPushNotificationOn.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefPushNotificationKey, value);
  }

  Future<void> slideScreenBrightness(double value) async {
    screenBrightness.value = value;
    try {
      await ScreenBrightness().setApplicationScreenBrightness(value);
    } catch (e) {
      debugPrint("밝기 변경 실패: $e");
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_prefScreenBrightnessKey, value);
  }
}

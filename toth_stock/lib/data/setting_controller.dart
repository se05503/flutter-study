import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  static const String _prefPushNotificationKey = "isPushNotificationSwitchOn";
  static const String _prefScreenBrightnessKey = "screenBrightness";
  static const String _prefDateTimeKey = "dateTime";

  final RxBool isPushNotificationOn = false.obs;
  final RxDouble screenBrightness = 0.5.obs;
  final Rxn<DateTime> dateTime = Rxn<DateTime>();

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
    final String? dateStr = prefs.getString(_prefDateTimeKey);
    dateTime.value = dateStr != null ? DateTime.parse(dateStr) : null;
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

  Future<void> updateDateTime(DateTime dateTime) async {
    this.dateTime.value = dateTime;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefDateTimeKey, dateTime.toIso8601String());
  }
}

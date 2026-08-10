import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  static const String _prefPushNotificationKey = "isPushNotificationSwitchOn";
  static const String _prefScreenBrightnessKey = "soundVolume";
  final RxBool isPushNotificationOn = false.obs;
  final RxDouble screenBrightness = 0.5.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    isPushNotificationOn.value = prefs.getBool(_prefPushNotificationKey) ?? false;
    screenBrightness.value = prefs.getDouble(_prefScreenBrightnessKey) ?? 0.5;
  }

  Future<void> togglePushNotification(bool value) async {
    isPushNotificationOn.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefPushNotificationKey, value);
  }

  Future<void> slideScreenBrightness(double value) async {
    screenBrightness.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_prefScreenBrightnessKey, value);
  }
}
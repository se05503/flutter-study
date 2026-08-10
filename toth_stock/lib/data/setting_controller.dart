import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  static const String _prefKey = "isPushNotificationSwitchOn";
  final RxBool isPushNotificationOn = false.obs; // Rx로 선언하여 상태 변화를 관찰 가능하게 만듬

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    isPushNotificationOn.value = prefs.getBool(_prefKey) ?? false;
  }

  Future<void> togglePushNotification(bool value) async {
    isPushNotificationOn.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefKey, value);
  }
}
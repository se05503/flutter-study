import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/setting_controller.dart';
import 'package:toth_stock/screen/main/stock/s_opensource.dart';
import 'package:toth_stock/screen/widget/w_big_button.dart';
import 'package:toth_stock/screen/widget/w_setting_datepicker.dart';
import 'package:toth_stock/screen/widget/w_setting_number_picker.dart';
import 'package:toth_stock/screen/widget/w_setting_switch.dart';
import '../../widget/w_setting_slider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final settingData = Get.find<SettingController>();
  bool isToggleOn = false;

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
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          Obx(
            () => SettingSwitch(
              value: settingData.isPushNotificationOn.value,
              onChanged: (value) {
                settingData.togglePushNotification(value);
              },
            ),
          ),
          Obx(
            () => SettingSlider(
              value: settingData.screenBrightness.value,
              onChanged: (value) {
                settingData.slideScreenBrightness(value);
              },
            ),
          ),
          Obx(
            () => SettingDatePicker(
              value: settingData.dateTime.value,
              onChanged: (dateTime) {
                settingData.updateDateTime(dateTime);
              },
            ),
          ),
          Obx(
            () => SettingNumberPicker(
              value: settingData.selectedNumber.value,
              onChanged: (number) {
                settingData.updateNumber(number);
              },
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Text(
                  "오픈소스",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Expanded(child: Spacer()),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OpenSourceScreen(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/image/ic_arrow_right.svg",
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

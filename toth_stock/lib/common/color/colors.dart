import 'package:flutter/material.dart';
import 'app_colors.dart';

class AbstractThemeColors {

  static Color get seedColor => const Color(0xff26ff8c);

  static Color get veryBrightGrey => AppColors.brightGrey;

  static Color get drawerBg => const Color.fromARGB(255, 255, 255, 255);

  static Color get scrollableItem => const Color.fromARGB(255, 57, 57, 57);

  static Color get iconButton => const Color.fromARGB(255, 0, 0, 0);

  static Color get iconButtonInactivate => const Color.fromARGB(255, 162, 162, 162);

  static Color get inActivate => const Color.fromARGB(255, 200, 207, 220);

  static Color get activate => const Color.fromARGB(255, 63, 72, 95);

  static Color get badgeBg => AppColors.blueGreen;

  static Color get textBadgeText => Colors.white;

  static Color get badgeBorder => Colors.transparent;

  static Color get divider => const Color.fromARGB(255, 80, 80, 80);

  static Color get text => AppColors.darkGrey;

  static Color get hintText => AppColors.middleGrey;

  static Color get focusedBorder => AppColors.darkGrey;

  static Color get confirmText => AppColors.blue;

  static Color get drawerText => text;

  static Color get snackbarBgColor => AppColors.mediumBlue;

  static Color get blueButtonBackground => AppColors.darkBlue;
  
  static Color get appBarBackground => const Color.fromARGB(255, 16, 16, 18);
  static Color get buttonBackground => const Color.fromARGB(255, 48, 48, 48);
  static Color get roundedLayoutBackground => const Color.fromARGB(255, 24, 24, 24);
  static Color get unreadColor => const Color.fromARGB(255, 48, 48, 48);
  static Color get lessImportantColor => AppColors.grey;
  static const Color plus = Color.fromARGB(255, 230, 71, 83);
  static const Color minus = Color.fromARGB(255, 9, 110, 216);
}

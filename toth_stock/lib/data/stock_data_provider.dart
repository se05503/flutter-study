import 'dart:ui';
import '../common/color/colors.dart';

abstract mixin class StockDataProvider {

  int get currentPrice;
  int get yesterdayClosePrice;

  double get todayPercentage =>
      (currentPrice - yesterdayClosePrice) / yesterdayClosePrice * 100;

  String get todayPercentageString =>
      "$symbol${todayPercentage.toStringAsFixed(1)}%";

  bool get isPlus => currentPrice > yesterdayClosePrice;

  bool get isSame => currentPrice == yesterdayClosePrice;

  bool get isMinus => currentPrice < yesterdayClosePrice;

  String get symbol => isSame
      ? ""
      : isPlus
      ? "+"
      : "-";

  Color get color => isSame
      ? AbstractThemeColors.lessImportantColor
      : isPlus
      ? AbstractThemeColors.plus
      : AbstractThemeColors.minus;
}
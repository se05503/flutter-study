import 'package:toth_stock/common/data/preference/item/nullable_preference_item.dart';
import 'package:toth_stock/common/theme/custom_theme.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
}

import 'package:flutter/cupertino.dart';
import 'package:toth_stock/common/color/colors.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final Color? backgroundColor;
  const RoundedContainer({required this.child, super.key, this.borderRadius = 20, this.backgroundColor, this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15)});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(color: backgroundColor ?? AbstractThemeColors.roundedLayoutBackground, borderRadius: BorderRadius.circular(borderRadius)),
        child: child
    );
  }
}

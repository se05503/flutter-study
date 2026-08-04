import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toth_stock/common/color/colors.dart';

class LongButton extends StatelessWidget {
  final String title;

  const LongButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Text(title, style: TextStyle(color: Colors.white)),
          Expanded(child: Container()),
          SvgPicture.asset(
            'assets/image/ic_arrow_right.svg',
            width: 16,
            height: 16,
            colorFilter: ColorFilter.mode(AbstractThemeColors.lessImportantColor, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}

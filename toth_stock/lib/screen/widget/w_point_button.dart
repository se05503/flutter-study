import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toth_stock/common/color/colors.dart';

class PointButton extends StatelessWidget {
  final int point;
  const PointButton({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("내 포인트", style: TextStyle(color: AbstractThemeColors.lessImportantColor)),
      Expanded(child: Container()),
      Text("$point 원", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      SizedBox(width: 10,),
      SvgPicture.asset(
        'assets/image/ic_arrow_right.svg',
        width: 16,
        height: 16,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    ],);
  }
}

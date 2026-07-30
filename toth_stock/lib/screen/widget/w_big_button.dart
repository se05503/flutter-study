import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toth_stock/screen/widget/w_rounded_container.dart';

class BigButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const BigButton(this.text, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          SvgPicture.asset(
            'assets/image/ic_arrow_right.svg',
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
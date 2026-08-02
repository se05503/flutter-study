import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/vo_benefit.dart';

class BenefitItem extends StatelessWidget {
  final Benefit benefit;
  const BenefitItem({super.key, required this.benefit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Image.asset(benefit.imagePath, width: 50, height: 50),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(benefit.subTitle, style: TextStyle(fontSize: 13, color: AbstractThemeColors.lessImportantColor, fontWeight: FontWeight.bold)),
              SizedBox(height: 5,),
              Text(benefit.title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blue))
            ],
          )
        ],
      ),
    );
  }
}

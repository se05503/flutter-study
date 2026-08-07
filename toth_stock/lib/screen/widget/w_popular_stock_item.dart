import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/vo_stock.dart';

class PopularStockItem extends StatelessWidget {
  final int number;
  final PopularStock stock;
  const PopularStockItem(this.number, this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(children: [
        SizedBox(width: 40, child: Text(number.toString(), style: TextStyle(color: AbstractThemeColors.lessImportantColor))),
        Text(stock.name, style: TextStyle(color: AbstractThemeColors.lessImportantColor, fontWeight: FontWeight.bold, fontSize: 16)),
        Expanded(child: Spacer()),
        Text(stock.todayPercentageString, style: TextStyle(color: stock.color, fontWeight: FontWeight.bold)),
      ],),
    );
  }
}

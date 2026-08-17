import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/vo_stock.dart';
import 'package:toth_stock/screen/main/stock/s_stock_detail.dart';

class PopularStockItem extends StatelessWidget {
  final int number;
  final PopularStock stock;

  const PopularStockItem(this.number, this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child:
        OpenContainer<bool>(
          openColor: AbstractThemeColors.roundedLayoutBackground,
          closedColor: AbstractThemeColors.roundedLayoutBackground,
          openBuilder: (BuildContext context, VoidCallback _) {
            return StockDetailScreen(stock.name);
          },
          closedBuilder: (BuildContext context, VoidCallback action) {
            return Row(children: [
              SizedBox(width: 40,
                  child: Text(number.toString(), style: TextStyle(
                      color: AbstractThemeColors.lessImportantColor))),
              Text(stock.name, style: TextStyle(
                  color: AbstractThemeColors.lessImportantColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
              Expanded(child: Spacer()),
              Text(stock.todayPercentageString, style: TextStyle(
                  color: stock.color, fontWeight: FontWeight.bold)),
            ],);
          },
        )
    );
  }
}

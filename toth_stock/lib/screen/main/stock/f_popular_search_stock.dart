import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/vo_stock.dart';
import 'package:collection/collection.dart';
import '../../widget/w_popular_stock_item.dart';

class PopularSearchStockList extends StatelessWidget {
  const PopularSearchStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              children: [
                Text(
                  "인기 검색",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Expanded(child: Spacer()),
                Text("오늘 ${DateFormat("HH:mm").format(DateTime.now())} 기준", style: TextStyle(color: AbstractThemeColors.lessImportantColor, fontSize: 12),)
              ],
            ),
          ),
          ...popularStockList.mapIndexed((index, element) => PopularStockItem(index+1, element))
        ],
      ),
    );
  }
}

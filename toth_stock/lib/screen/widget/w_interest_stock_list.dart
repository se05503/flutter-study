import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toth_stock/data/vo_stock.dart';
import '../../common/color/colors.dart';

class InterestStockList extends StatelessWidget {
  const InterestStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...myInterestStocks.map((element) => StockItem(element))],
    );
  }
}

class StockItem extends StatelessWidget {
  final Stock stock;

  const StockItem(this.stock, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AbstractThemeColors.roundedLayoutBackground,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(stock.imagePath, width: 30),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              stock.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                stock.todayPercentageString,
                style: TextStyle(
                  color: stock.color,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4,),
              Text(
                "${NumberFormat('#,###').format(stock.currentPrice)}원",
                style: TextStyle(
                  color: AbstractThemeColors.lessImportantColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

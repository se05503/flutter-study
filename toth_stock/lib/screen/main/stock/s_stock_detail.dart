import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/colors.dart';

class StockDetailScreen extends StatelessWidget {
  final String stockName;
  const StockDetailScreen(this.stockName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AbstractThemeColors.roundedLayoutBackground,
      appBar: AppBar(
        backgroundColor: AbstractThemeColors.appBarBackground,
        foregroundColor: Colors.white,
        title: Text("주식 상세 화면", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Text(stockName, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))
        ],),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toth_stock/data/search_stock_data.dart';
import 'package:toth_stock/screen/main/stock/s_stock_detail.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchDataProvider {
  final TextEditingController controller;
  SearchAutoCompleteList({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListView.builder(
        itemCount: searchData.autoCompleteList.length,
        itemBuilder: (context, index) {
          final stockName = searchData.autoCompleteList[index].name;
          return GestureDetector(
          onTap: () {
            controller.clear();
            searchData.addHistory(stockName);
            Navigator.push(context, MaterialPageRoute(builder: (context) => StockDetailScreen(stockName)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Text(
              stockName,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toth_stock/data/search_stock_data.dart';
import 'package:toth_stock/screen/main/stock/s_stock_detail.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchDataProvider {
  SearchAutoCompleteList({super.key});

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
            // 주식 이름을 탭하면 히스토리에 추가되어야 한다.
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

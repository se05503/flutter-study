import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toth_stock/data/search_stock_data.dart';

class SearchAutoCompleteList extends StatelessWidget {
  SearchAutoCompleteList({super.key});

  late final searchData = Get.find<SearchStockData>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ListView.builder(
        itemCount: searchData.autoCompleteList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Text(
            searchData.autoCompleteList[index].name,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:toth_stock/data/vo_stock.dart';

abstract mixin class SearchDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override void onInit() {
    loadLocalStockJson();
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final String jsonString = await rootBundle.loadString("assets/json/stock_list.json");
    final List<dynamic> jsonResponse = jsonDecode(jsonString);
    final List<SimpleStock> stockList = jsonResponse.map((element) => SimpleStock.fromJson(element)).toList();
    stocks.addAll(stockList);
  }

  void search(String keyword) {
    if(keyword.isEmpty) {
      autoCompleteList.value = [];
      return;
    }
    autoCompleteList.value = stocks.where((element) => element.name.contains(keyword)).toList();
  }
}

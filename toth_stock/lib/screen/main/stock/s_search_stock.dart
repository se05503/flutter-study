import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/search_stock_data.dart';
import '../../widget/w_stock_search_app_bar.dart';
import 'f_popular_search_stock.dart';
import 'f_search_auto_complete_list.dart';
import 'f_search_stock_history.dart';

class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends State<SearchStockScreen> with SearchDataProvider {
  final controller = TextEditingController();

  @override
  void initState() {
    Get.put(SearchStockData());
    controller.addListener(() {
      searchData.search(controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchStockData>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AbstractThemeColors.roundedLayoutBackground,
      appBar: StockSearchAppBar(controller: controller),
      body: Obx(() {
        return searchData.autoCompleteList.isEmpty
            ? ListView(
                children: [SearchStockHistoryList(), PopularSearchStockList()],
              )
            : SearchAutoCompleteList(controller: controller);
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toth_stock/common/color/colors.dart';
import '../../widget/w_stock_search_app_bar.dart';
import 'f_popular_search_stock.dart';
import 'f_search_stock_history.dart';

class SearchStockFragment extends StatefulWidget {
  const SearchStockFragment({super.key});

  @override
  State<SearchStockFragment> createState() => _SearchStockFragmentState();
}

class _SearchStockFragmentState extends State<SearchStockFragment> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AbstractThemeColors.roundedLayoutBackground,
      appBar: StockSearchAppBar(controller: controller),
      body: ListView(children: [
        SearchStockHistoryList(),
        PopularSearchStockList()
      ],),
    );
  }
}

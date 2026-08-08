import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toth_stock/common/color/app_colors.dart';
import 'package:toth_stock/data/search_stock_data.dart';
import 'package:toth_stock/screen/main/stock/s_stock_detail.dart';

class SearchStockHistoryList extends StatefulWidget {
  const SearchStockHistoryList({super.key});

  @override
  State<SearchStockHistoryList> createState() => _SearchStockHistoryListState();
}

class _SearchStockHistoryListState extends State<SearchStockHistoryList>
    with SearchDataProvider {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: SizedBox(
        width: double.infinity,
        height: 36,
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: searchData.searchHistoryList.length,
            itemBuilder: (context, index) {
              final stockName = searchData.searchHistoryList[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StockDetailScreen(stockName),
                          ),
                        );
                      },
                      child: Text(
                        stockName,
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ),
                    SizedBox(width: 2),
                    GestureDetector(
                      onTap: () {
                        searchData.removeHistory(stockName);
                      },
                      child: Icon(Icons.close, color: Colors.white70, size: 20),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

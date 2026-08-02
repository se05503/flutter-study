import 'package:flutter/material.dart';

import '../../../common/color/colors.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: AbstractThemeColors.appBarBackground,
          actions: [
            Image.asset("assets/image/ic_stock_search.png", width: 30, height: 30),
            SizedBox(width: 10,),
            Image.asset("assets/image/ic_stock_calendar.png", width: 30, height: 30),
            SizedBox(width: 10,),
            Image.asset("assets/image/ic_stock_settings.png", width: 30, height: 30),
            SizedBox(width: 10,),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              tabBar,
              myAccount,
              SizedBox(height: 20,),
              interestedStocks
            ],
          ),
        )
      ],
    );
  }
  Widget get title => Padding(
    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("토스증권", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
        SizedBox(width: 10,),
        Text("S&P 500", style: TextStyle(color: AbstractThemeColors.lessImportantColor, fontWeight: FontWeight.bold, fontSize: 13)),
        SizedBox(width: 10,),
        Text("3,919.29", style: TextStyle(color: AbstractThemeColors.plus, fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    ),
  );
  Widget get tabBar => Placeholder();
  Widget get myAccount => Placeholder();
  Widget get interestedStocks => Placeholder();
}

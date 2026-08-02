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
  Widget get title => Placeholder();
  Widget get tabBar => Placeholder();
  Widget get myAccount => Placeholder();
  Widget get interestedStocks => Placeholder();
}

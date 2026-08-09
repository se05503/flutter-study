import 'package:flutter/material.dart';
import 'package:toth_stock/screen/main/stock/s_setting.dart';
import '../../../common/color/colors.dart';
import 'f_my_stock.dart';
import 's_search_stock.dart';
import 'f_today_discovery.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: AbstractThemeColors.roundedLayoutBackground,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchStockScreen()));
              },
              child: Image.asset(
                "assets/image/ic_stock_search.png",
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 10),
            Image.asset(
              "assets/image/ic_stock_calendar.png",
              width: 30,
              height: 30,
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
              },
              child: Image.asset(
                "assets/image/ic_stock_settings.png",
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              tabBar,
              if(currentIndex == 0) const MyStockFragment() else const TodayDiscoveryFragment()
            ],
          ),
        ),
      ],
    );
  }

  Widget get title => Container(
    color: AbstractThemeColors.roundedLayoutBackground,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: 16,),
        Text(
          "토스증권",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "S&P 500",
          style: TextStyle(
            color: AbstractThemeColors.lessImportantColor,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "3,919.29",
          style: TextStyle(
            color: AbstractThemeColors.plus,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    ),
  );

  Widget get tabBar => Container(
    color: AbstractThemeColors.roundedLayoutBackground,
    child: Column(
      children: [
        TabBar(
          onTap: (currentIndex) {
            setState(() {
              this.currentIndex = currentIndex;
            });
          },
          labelColor: Colors.white,
          unselectedLabelColor: AbstractThemeColors.lessImportantColor,
          labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelPadding: const EdgeInsets.symmetric(vertical: 16),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
          controller: tabController,
          tabs: [Text("내 주식"), Text("오늘의 발견")],
        ),
      ],
    ),
  );

  Widget get myAccount => Placeholder();

  Widget get interestedStocks => Placeholder();
}

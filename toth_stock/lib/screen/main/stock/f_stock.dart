import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0;
  double scrollThreshold = 20;
  int animationDuration = 10;

  double getValue(double initial, double target) {
    if (scrollPosition > scrollThreshold) return target;
    double ratio = scrollPosition / scrollThreshold;
    return initial + (target - initial) * ratio;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        scrollPosition = _scrollController.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: AbstractThemeColors.roundedLayoutBackground,
          expandedHeight: 80,
          flexibleSpace: AnimatedContainer(
            duration: Duration(milliseconds: animationDuration),
            padding: EdgeInsets.only(top: getValue(80, 50)),
            child: title,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchStockScreen()),
                );
              },
              child: SvgPicture.asset(
                'assets/image/ic_search.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 16),
            SvgPicture.asset(
              'assets/image/ic_calendar.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
              child: SvgPicture.asset(
                'assets/image/ic_setting.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              tabBar,
              if (currentIndex == 0)
                const MyStockFragment()
              else
                const TodayDiscoveryFragment(),
            ],
          ),
        ),
      ],
    );
  }

  Widget get title => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(width: 16),
      AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: animationDuration),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: getValue(18, 24),
        ),
        child: Text("토스증권"),
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
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
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

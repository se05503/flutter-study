import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/screen/main/benefit/f_benefit.dart';
import 'package:toth_stock/screen/main/home/f_home.dart';
import 'package:toth_stock/screen/main/stock/f_stock.dart';
import 'package:toth_stock/screen/main/tosspay/f_tosspay.dart';
import 'package:toth_stock/screen/main/total/f_total.dart';

class MainScreen extends StatefulWidget {
  static const double bottomNavigationHeight = 66;
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // 초기 화면 = 홈 화면

  final List<Widget> _pages = [
    HomeFragment(),
    BenefitFragment(),
    TossPayFragment(),
    StockFragment(),
    TotalFragment(),
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      FlutterNativeSplash.remove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: SizedBox(
        height: MainScreen.bottomNavigationHeight,
        child: BottomNavigationBar(
          backgroundColor: AbstractThemeColors.appBarBackground,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: [
            _buildBottomItem("home", "홈"),
            _buildBottomItem("benefit", "혜택"),
            _buildBottomItem("toss_pay", "토스페이"),
            _buildBottomItem("stock", "주식"),
            _buildBottomItem("total", "전체"),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomItem(String iconName, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/image/ic_$iconName.svg',
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        'assets/image/ic_$iconName.svg',
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}

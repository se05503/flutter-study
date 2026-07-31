import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/screen/notification/s_notification.dart';

class TossAppBar extends StatefulWidget {
  static const double appBarHeight = 60;
  const TossAppBar({super.key});

  @override
  State<TossAppBar> createState() => _TossAppBarState();
}

class _TossAppBarState extends State<TossAppBar> {
  bool _showRedDot = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: TossAppBar.appBarHeight,
        color: AbstractThemeColors.appBarBackground,
        child: Row(
          children: [
            SizedBox(width: 16),
            Image.asset(
              "assets/image/ic_appbar_toss.png",
              height: 36,
              color: Colors.grey,
              colorBlendMode: BlendMode.srcIn,
            ),
            Expanded(child: Container()),
            SvgPicture.asset(
              'assets/image/ic_map.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            SizedBox(width: 8),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                  },
                  child: SvgPicture.asset(
                    'assets/image/ic_notification.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                if (_showRedDot)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

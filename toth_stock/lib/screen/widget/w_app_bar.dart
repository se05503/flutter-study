import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toth_stock/common/color/colors.dart';
import 'package:toth_stock/data/appbar_controller.dart';
import 'package:toth_stock/screen/notification/s_notification.dart';

class TossAppBar extends StatefulWidget {
  static const double appBarHeight = 60;

  const TossAppBar({super.key});

  @override
  State<TossAppBar> createState() => _TossAppBarState();
}

class _TossAppBarState extends State<TossAppBar> {
  bool _showRedDot = true;
  final controller = Get.find<AppBarController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: TossAppBar.appBarHeight,
        color: AbstractThemeColors.appBarBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              AnimatedCrossFade(
                firstChild: SizedBox(
                  width: 100,
                  height: 30,
                  child: Image.asset(
                    "assets/image/toss_logo.png",
                    color: Colors.white,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
                secondChild: SizedBox(
                  width: 100,
                  height: 30,
                  child: Image.asset(
                    "assets/image/toss_bank_logo.png",
                    color: Colors.white,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
                crossFadeState: controller.tappingCount.value != 3 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: 1500.ms,
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    controller.tappingCount < 3
                        ? controller.increment()
                        : controller.reset();
                  });
                },
                child:
                    SvgPicture.asset(
                          'assets/image/ic_ghost.svg',
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          ),
                        )
                        .animate(
                          onPlay: (controller) =>
                              controller.repeat(reverse: true),
                        )
                        .slideX(
                          begin: 0,
                          end: 0.3,
                          duration: 2000.ms,
                          curve: Curves.easeInOut,
                        ),
              ),
              SizedBox(width: 12),
              SvgPicture.asset(
                'assets/image/ic_map.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8),
              Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
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
                  )
                  .animate(onPlay: (controller) => controller.repeat())
                  .shake(duration: 1000.ms, hz: 5)
                  .then()
                  .shake(duration: 2000.ms, hz: 0),
            ],
          ),
        ),
      ),
    );
  }
}

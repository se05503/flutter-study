import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:toth_stock/common/color/colors.dart';

class TossPayFragment extends StatefulWidget {
  const TossPayFragment({super.key});

  @override
  State<TossPayFragment> createState() => _TossPayFragmentState();
}

class _TossPayFragmentState extends State<TossPayFragment>
    with SingleTickerProviderStateMixin {

  late final controller = AnimationController(
    vsync: this,
    duration: 2000.ms,
    value: 0.5,
  );
  late Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.linear,
  );
  bool isLookingLeft = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {}); // animation ticker가 돌 때마다 build 함수가 실행됨
    });
    controller.addStatusListener((status) {
      setState(() {
        if(status == AnimationStatus.forward) {
          isLookingLeft = false;
        } else if(status == AnimationStatus.reverse) {
          isLookingLeft = true;
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AbstractThemeColors.roundedLayoutBackground,
      appBar: AppBar(
        backgroundColor: AbstractThemeColors.appBarBackground,
        title: Text('토스 유령', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Text(
                  "토스 유령을 움직여 보세요",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.reverse(); // animation.value = x → 0.0
                      },
                      child: SvgPicture.asset(
                        "assets/image/ic_backward.svg",
                        width: 34,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        controller.value = 0.5;
                        controller.stop();
                      },
                      child: SvgPicture.asset(
                        "assets/image/ic_reset.svg",
                        width: 26,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    GestureDetector(
                      onTap: () {
                        controller.forward(); // animation.value = 0.0 → 1.0
                      },
                      child: SvgPicture.asset(
                        "assets/image/ic_forward.svg",
                        width: 34,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left:
                (MediaQuery.of(context).size.width / 2 - 50) +
                    (animation.value -0.5)* 240,
            top: MediaQuery.of(context).size.height / 2 - 200,
            child: Transform.flip(
              flipX: isLookingLeft,
              child: Lottie.asset(
                "assets/json/ghost.json",
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

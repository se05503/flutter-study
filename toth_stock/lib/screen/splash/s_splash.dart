import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../main/s_main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // 네이티브 스플래시는 제거
    FlutterNativeSplash.remove();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) { // context를 사용하기 전 위젯이 여전히 존재하는지 확인 (메모리 누수 방지)
        // MainScreen으로 이동 (뒤로가기 버튼으로 스플래시로 돌아오지 못하게 pushReplacement 사용)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Scaffold로 감싸야 배경색이 제대로 나오고 레이아웃이 깨지지 않습니다.
    return Scaffold(
      backgroundColor: Colors.white, // 배경색 지정
      body: Center(
        child: Image.asset(
          "assets/image/splash.png",
          width: 192,
          height: 192,
        )
      )
    );;
  }
}

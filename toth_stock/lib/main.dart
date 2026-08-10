import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart';
import 'package:toth_stock/data/setting_controller.dart';
import 'package:toth_stock/screen/main/s_main_screen.dart';

void main() {
  // 앱 엔진 초기화
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // 네이티브 스플래시가 자동으로 사라지지 않게 고정
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setLocaleMessages('ko', KoMessages());
  Get.put(SettingController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}


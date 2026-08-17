import 'package:get/get.dart';

class AppBarController extends GetxController {
  final RxInt tappingCount = 0.obs;

  void increment() {
    tappingCount.value++;
  }

  void reset() {
    tappingCount.value = 0;
  }
}
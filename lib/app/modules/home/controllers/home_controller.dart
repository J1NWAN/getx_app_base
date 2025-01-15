import 'package:get/get.dart';

class HomeController extends GetxController {
  final _count = 0.obs;
  int get count => _count.value;

  void increment() {
    _count.value++;
  }

  @override
  void onClose() {
    // 정리 로직
    super.onClose();
  }
}

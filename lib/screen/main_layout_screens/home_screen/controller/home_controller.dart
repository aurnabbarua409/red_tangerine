import 'package:get/get.dart';
import 'package:red_tangerine/service/local_storage.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final showDemo1 = false.obs;
  final showDemo2 = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    showDemo1.value = Localstorage.fromSignup;
  }

  void onChangeIndex(int value) {
    currentIndex.value = value;
    update();
  }

  void onShowDemo2() {
    showDemo1.value = false;
    showDemo2.value = true;
    update();
  }

  void onOkayDemo2() {
    showDemo1.value = false;
    showDemo2.value = false;
    update();
  }
}

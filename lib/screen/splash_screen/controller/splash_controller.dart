import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_log.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onInitialize();
  }

  void onInitialize() async {
    await Future.delayed(const Duration(seconds: 2));
    appLogger(title: "Splash Screen", message: "Splash Screen initializer");
    Get.offAllNamed(AppRoutes.authHomePage);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    appLogger(title: "Splash Screen", message: "Splash Screen disposed");
  }
}

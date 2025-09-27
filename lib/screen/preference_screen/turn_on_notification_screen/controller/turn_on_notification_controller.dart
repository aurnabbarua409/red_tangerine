import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class TurnOnNotificationController extends GetxController {
  final fromUpdate = false.obs;
  final turnonNotification = true.obs;
  void onNext() {
    Get.toNamed(
      AppRoutes.pleaseShareYourLocationScreen,
      arguments: {'fromUpdate': false},
    );
  }

  void onUpdate() {}
  void notificationTurnOn(bool value) {
    turnonNotification.value = value;
    update();
  }
}

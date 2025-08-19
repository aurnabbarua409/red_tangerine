import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';
import 'package:red_tangerine/utils/app_log.dart';

class WhereParentingJourneyController extends GetxController {
  final List<bool> isParenting = [false, false, false];

  void onJustStarting() {
    isParenting[0] = true;
    isParenting[1] = false;
    isParenting[2] = false;
    update();
    appLogger(
      title: 'in Where parenting journey',
      message: 'on journey start pressed',
    );
  }

  void onmanagingDayToDay() {
    isParenting[0] = false;
    isParenting[1] = true;
    isParenting[2] = false;
    update();
  }

  void mentorReady() {
    isParenting[0] = false;
    isParenting[1] = false;
    isParenting[2] = true;
    update();
  }

  void onNext() {
    Get.toNamed(AppRoutes.whatEnjoyAsParentScreen);
  }
}

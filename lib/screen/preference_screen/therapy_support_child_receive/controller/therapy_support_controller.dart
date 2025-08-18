import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class TherapySupportController extends GetxController {
  final isWaiting = false.obs;

  void onIsWaiting() {
    isWaiting.value = !isWaiting.value;
  }

  void onNext() {
    Get.toNamed(AppRoutes.whereParentingJourneyScreen);
  }
}

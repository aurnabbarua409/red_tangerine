import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class TherapySupportController extends GetxController {
  final isWaiting = false.obs;
  final fromUpdate = false.obs;
  void onInitital() {
    var args = Get.arguments;
    fromUpdate.value = args['fromUpdate'];
  }

  void onIsWaiting() {
    isWaiting.value = !isWaiting.value;
  }

  void onNext() {
    Get.toNamed(
      AppRoutes.whereParentingJourneyScreen,
      arguments: {'fromUpdate': false},
    );
  }
  void onUpdate(){}
}

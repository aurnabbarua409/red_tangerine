import 'package:get/get.dart';
import 'package:red_tangerine/routes/app_routes.dart';

class VerificationController extends GetxController {
  final otpValue = ''.obs;
  final email = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final args = Get.arguments;
    email.value = args['email'];
  }

  void onVerify() {
    Get.toNamed(AppRoutes.preferenceHomeScreen);
  }
}

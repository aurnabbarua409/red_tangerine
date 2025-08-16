import 'package:get/get.dart';

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

  void onVerify() {}
}

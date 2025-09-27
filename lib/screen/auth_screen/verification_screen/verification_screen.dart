import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/verification_screen/controller/verification_controller.dart';
import 'package:red_tangerine/screen/auth_screen/verification_screen/widgets/custom_otp_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: VerificationController(),
      builder: (controller) => CommonScreenWidget(
        title: AppStrings.verifyEmail,
        subtitle:
            '${AppStrings.weSendVerificationCode} ${controller.email.value}',
        body: [
          ButtonWidget.text(
            text: AppStrings.updateEmail,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textDecoration: TextDecoration.underline,
            textColor: AppColors.claySolid,
            ontap: controller.onUpdateEmail,
          ),
          SpaceWidget(height: 20),
          CustomOtpWidget(
            onSubmit: (value) {
              controller.otpValue.value = value;
            },
          ),
          SpaceWidget(height: 30),
          ButtonWidget(
            text: AppStrings.verify,
            margin: EdgeInsets.all(0),
            ontap: controller.onVerify,
          ),
          SpaceWidget(height: 20),
          ButtonWidget.text(
            textColor: AppColors.claySolid,
            text: AppStrings.resendCode,
            fontSize: 16,
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

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
        title: AppStrings.verification,
        subtitle:
            '${AppStrings.weSendVerificationCode} ${controller.email.value}',
        body: [
          ButtonWidget.text(
            text: AppStrings.notYours,
            textColor: AppColors.red,
            textDecoration: TextDecoration.underline,
            fontSize: 0.24,
            ontap: () {},
          ),
          SpaceWidget(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: TextWidget.blackLight(text: AppStrings.code, fontSize: 0.27),
          ),
          SpaceWidget(height: 30),
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
          SpaceWidget(height: 15),
          ButtonWidget.text(
            textColor: AppColors.red,
            text: AppStrings.resendCode,
            fontSize: 0.26,
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

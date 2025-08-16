import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/verification_screen/controller/verification_controller.dart';
import 'package:red_tangerine/screen/auth_screen/verification_screen/widgets/custom_otp_widget.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      body: GetBuilder(
        init: VerificationController(),
        builder: (controller) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget.header(text: AppStrings.verification),
            TextWidget.blackLight(
              
              text:
                  '${AppStrings.weSendVerificationCode} ${controller.email.value}',
            ),
            SpaceWidget(height: 10),
            ButtonWidget.text(
              text: AppStrings.notYours,
              textDecoration: TextDecoration.underline,
              fontSize: 0.24,
              ontap: () {},
            ),
            SpaceWidget(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.blackLight(
                text: AppStrings.code,
                fontSize: 0.27,
              ),
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
              ontap: () {},
            ),
            SpaceWidget(height: 15),
            ButtonWidget.text(
              text: AppStrings.resendCode,
              fontSize: 0.26,
              ontap: () {},
            ),
          ],
        ),
      ),
      footer: null,
    );
  }
}

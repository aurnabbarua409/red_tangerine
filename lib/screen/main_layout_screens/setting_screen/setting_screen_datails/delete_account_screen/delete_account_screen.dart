import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/delete_account_screen/controller/delete_account_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: Column(
        children: [
          AppBarWidget(title: AppStrings.deletedAccount),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GetBuilder(
                init: DeleteAccountController(),
                builder: (controller) => Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget.black(
                          text: AppStrings.thisWillPermanentlyRemoveProfile,
                          fontSize: 0.28,
                        ),
                        SpaceWidget(height: 30),
                        TextformfieldWidget(
                          controller: controller.passwordController,
                          validator: (value) =>
                              AppValidator.passwordValidator(value),
                          label: AppStrings.enterYourPassword,
                          hintText: AppStrings.writeYourPassword,
                        ),
                        SpaceWidget(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: ButtonWidget.normal(
                                text: AppStrings.cancel,
                                borderColor: AppColors.red_800,
                                height: 5,
                                margin: EdgeInsets.all(0),
                                ontap: () {
                                  Get.back();
                                },
                              ),
                            ),
                            SpaceWidget(width: 20),
                            Expanded(
                              child: ButtonWidget.normal(
                                text: AppStrings.delete,
                                height: 5,
                                borderColor: AppColors.red_800,
                                backgroundColor: AppColors.red_800,
                                textColor: AppColors.white,
                                margin: EdgeInsets.all(0),
                                ontap: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

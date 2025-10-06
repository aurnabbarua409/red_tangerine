import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/auth_screen/create_new_password_screen/controller/create_new_password_controller.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateNewPasswordController(),
      builder: (controller) {
        return CommonScreenWidget(
          title: AppStrings.createNewPassTitle,
          subtitle: AppStrings.createNewPassSubtitle,
          formKey: controller.formKey,
          body: [
            SpaceWidget(height: 20),
            TextformfieldWidget(
              obscureText: true,
              controller: controller.setPasswordController,
              validator: (value) {
                return AppValidator.defaultvalidator(
                  value: value,
                  message: AppStrings.pleaseEnterYourPassword,
                );
              },
              label: AppStrings.newPassword,
              suffixIcon: IconButton(
                onPressed: controller.onChangeVisibleNew,
                icon: Icon(
                  color: AppColors.grey_800,
                  controller.isVisibleNew.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
            ),
            SpaceWidget(height: 20),
            TextformfieldWidget(
              obscureText: true,
              controller: controller.confirmPasswordController,
              validator: (value) {
                if (value != controller.setPasswordController.text) {
                  return AppStrings.passwordMismatchedError;
                }
                return AppValidator.defaultvalidator(
                  value: value,
                  message: AppStrings.pleaseEnterYourPassword,
                );
              },
              label: AppStrings.confirNewPassword,
              suffixIcon: IconButton(
                onPressed: controller.onChangeVisibleConfirm,
                icon: Icon(
                  color: AppColors.grey_800,
                  controller.isVisibleConfirm.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
            ),
            SpaceWidget(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                text: AppStrings.passwordWarning,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontColor: AppColors.claySolid,
              ),
            ),
            SpaceWidget(height: 30),
            ButtonWidget(
              text: AppStrings.saveNewPassword,
              ontap: controller.onResetPassword,
            ),
          ],
        );
      },
    );
  }
}

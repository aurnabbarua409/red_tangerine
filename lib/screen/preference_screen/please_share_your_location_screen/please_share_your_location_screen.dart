import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/please_share_your_location_screen/controller/please_share_your_location_controller.dart';
import 'package:red_tangerine/utils/app_common_functions.dart';
import 'package:red_tangerine/utils/app_validator.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';
import 'package:red_tangerine/widgets/textformfield_widget.dart';

class PleaseShareYourLocationScreen extends StatefulWidget {
  const PleaseShareYourLocationScreen({super.key});

  @override
  State<PleaseShareYourLocationScreen> createState() =>
      _PleaseShareYourLocationScreenState();
}

class _PleaseShareYourLocationScreenState
    extends State<PleaseShareYourLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PleaseShareYourLocationController(),
      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          showProgressbar: !controller.fromUpdate.value,
          progress: 0.12,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.location,
          title: AppStrings.seeParentstitle,
          subtitle: AppStrings.seeParentSubtitle,
          body: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget.black(text: AppStrings.useMyCurrentLocation),
            ),
            TextFormField(
              controller: controller.locationController,
              maxLines: 1,
              validator: (value) => AppValidator.defaultvalidator(
                value: value,
                message: AppStrings.pleaseEnterSomething,
              ),

              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),

                suffixIcon: ButtonWidget.icon(
                  icon: AppIcons.locationFixedIcon,
                  ontap: () {},
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.white_700),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.white_700),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.white_700),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.white_700),
                ),
              ),
            ),
          ],
          footerButtonText: "Allow",
          onTap: controller.onNext,
          onUpdate: controller.onUpdate,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/let_other_know_about_u_screen/controller/let_other_know_about_u_controller.dart';
import 'package:red_tangerine/screen/preference_screen/let_other_know_about_u_screen/widget/message_box_widget.dart';
import 'package:red_tangerine/screen/preference_screen/let_other_know_about_u_screen/widget/suggest_text_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class LetOtherKnowAboutUScreen extends StatelessWidget {
  const LetOtherKnowAboutUScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LetOtherKnowAboutUController(),
      builder: (controller) {
        return CommonScreenWidget(
          showLeading: true,
          showProgressbar: true,
          progress: 0.3,
          fromUpdate: controller.fromUpdate.value,
          appbarTitle: AppStrings.yourBio,
          showSkip: true,
          onTapShowSkip: () => controller.onNext(),
          title: AppStrings.letOtherKnowAboutYou,
          subtitle: AppStrings.shortIntroHelpsOther,
          body: [
            SuggestTextWidget(
              ontap: () => controller.onSelectSuggestion(1),
              text: AppStrings.aParentingWin,
            ),
            SpaceWidget(height: 5),
            SuggestTextWidget(
              ontap: () => controller.onSelectSuggestion(2),
              text: AppStrings.somethingIWishIKnow,
            ),
            SpaceWidget(height: 5),
            SuggestTextWidget(
              ontap: () => controller.onSelectSuggestion(3),
              text: AppStrings.iAlwaysUpFor,
            ),
            SpaceWidget(height: 20),
            MessageBoxWidget(controller: controller.textEditingController),
            SpaceWidget(height: 20),
          ],

          onTap: controller.onNext,
          onUpdate: controller.onUpdate,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/about_us_screen/widget/about_us_item.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: Column(
        children: [
          AppBarWidget(title: AppStrings.faq),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AboutUsItem(text: AppStrings.faqQuestion1),
                    AboutUsItem(text: AppStrings.faqAnswer1),
                    SpaceWidget(height: 20),
                    AboutUsItem(text: AppStrings.faqQuestion2),
                    AboutUsItem(text: AppStrings.faqAnswer2),
                    SpaceWidget(height: 20),
                    AboutUsItem(text: AppStrings.faqQuestion3),
                    AboutUsItem(text: AppStrings.faqAnswer3),
                    SpaceWidget(height: 20),
                    AboutUsItem(text: AppStrings.faqQuestion4),
                    AboutUsItem(text: AppStrings.faqAnswer4),
                    SpaceWidget(height: 20),
                    AboutUsItem(text: AppStrings.faqQuestion5),
                    AboutUsItem(text: AppStrings.faqAnswer5),
                    SpaceWidget(height: 20),
                    AboutUsItem(text: AppStrings.faqQuestion6),
                    AboutUsItem(text: AppStrings.faqAnswer6),
                    SpaceWidget(height: 20),
                    AboutUsItem(text: AppStrings.faqQuestion7),
                    AboutUsItem(text: AppStrings.faqAnswer7),
                    SpaceWidget(height: 20),
                    AboutUsItem(text: AppStrings.faqQuestion8),
                    AboutUsItem(text: AppStrings.faqAnswer8),
                    SpaceWidget(height: 20),
                    AboutUsItem(text: AppStrings.faqQuestion9),
                    AboutUsItem(text: AppStrings.faqAnswer9),
                    SpaceWidget(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/main_layout_screens/profile_screen/profile_screen_datails/widgets/app_bar_widget.dart';
import 'package:red_tangerine/screen/main_layout_screens/setting_screen/setting_screen_datails/about_us_screen/widget/about_us_item.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      padding: EdgeInsets.all(0),
      body: Column(
        children: [
          AppBarWidget(title: AppStrings.aboutUs),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                AboutUsItem(text: AppStrings.aboutusPara1),
                SpaceWidget(height: 20),
                AboutUsItem(text: AppStrings.aboutusPara2),
                SpaceWidget(height: 20),
                AboutUsItem(text: AppStrings.aboutUsPara3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

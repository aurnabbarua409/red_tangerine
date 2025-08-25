import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/widgets/app_bar_widget.dart';
import 'package:red_tangerine/widgets/image_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: [
        TextWidget.black(
          text: AppStrings.matches,
          fontSize: 0.3,
          fontWeight: FontWeight.w600,
        ),
        SpaceWidget(height: 15),
        TextWidget.blackLight(text: AppStrings.rightSupportTakesTime),
        Spacer(),
        Center(
          child: Column(
            children: [
              ImageWidget(
                fromNetwork: false,
                image: AppImages.noMatchesImage,
                width: 70,
                height: 20,
                color: AppColors.grey_900,
                fit: BoxFit.fill,
              ),
              TextWidget.black(text: AppStrings.sorryNoMatchesYet),
            ],
          ),
        ),
        SpaceWidget(height: 20),
        Spacer(),
      ],
    );
  }
}

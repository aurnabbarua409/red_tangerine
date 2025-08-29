import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/controller/what_enjoy_as_parent_controller.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/widget/bullet_text_widget.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/widget/parent_button_widget.dart';
import 'package:red_tangerine/widgets/common_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class WhatEnjoyAsParent extends StatefulWidget {
  const WhatEnjoyAsParent({super.key});

  @override
  State<WhatEnjoyAsParent> createState() => _WhatEnjoyAsParentState();
}

class _WhatEnjoyAsParentState extends State<WhatEnjoyAsParent> {
  final _controller = Get.put(WhatEnjoyAsParentController());

  @override
  void initState() {
    super.initState();
    _controller.onInitital();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenWidget(
      fromUpdate: _controller.fromUpdate.value,
      appbarTitle: AppStrings.interestOrValue,
      title: AppStrings.whatYouEnjoyOrValueAsParent,
      subtitle: AppStrings.checkAnyThatReflect,
      body: [
        BulletTextWidget(text: AppStrings.interestWhatyouEnjoyWithChild),
        SpaceWidget(height: 10),
        Obx(
          () => Wrap(
            spacing: 8, // horizontal spacing
            runSpacing: 8, // vertical spacing
            children: List.generate(
              _controller.interests.length,
              (i) => ParentButtonWidget(
                label: _controller.interests[i],
                isSelected: _controller.isSelectedInterest[i],
                ontap: () => _controller.onSelectedInterest(i),
              ),
            ),
          ),
        ),

        SpaceWidget(height: 30),
        BulletTextWidget(text: AppStrings.valuesLifeStyle),
        SpaceWidget(height: 10),
        Obx(
          () => Wrap(
            spacing: 8, // horizontal space between buttons
            runSpacing: 8, // vertical space between rows
            children: List.generate(
              _controller.valuesLifeStyle.length,
              (i) => ParentButtonWidget(
                label: _controller.valuesLifeStyle[i],
                isSelected: _controller.isSelectedValuesLifeStyle[i],
                ontap: () => _controller.onSelectedValuesLifeStyle(i),
              ),
            ),
          ),
        ),
      ],

      onTap: _controller.onNext,
      onUpdate: _controller.onUpdate,
    );
  }
}

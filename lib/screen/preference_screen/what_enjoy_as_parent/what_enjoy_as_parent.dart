import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/controller/what_enjoy_as_parent_controller.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/widget/bullet_text_widget.dart';
import 'package:red_tangerine/screen/preference_screen/what_enjoy_as_parent/widget/parent_button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
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
    // TODO: implement initState
    super.initState();
    _controller.onInitital();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      fromUpdate: _controller.fromUpdate.value,
      appbarTitle: AppStrings.interestOrValue,
      title: AppStrings.whatYouEnjoyOrValueAsParent,
      subtitle: AppStrings.checkAnyThatReflect,
      body: [
        BulletTextWidget(text: AppStrings.interestWhatyouEnjoyWithChild),
        SpaceWidget(height: 10),
        for (int i = 0; i < _controller.interests.length; i = i + 2)
          Row(
            children: [
              ParentButtonWidget(
                label: _controller.interests[i],
                isSelected: _controller.isSelectedInterest[i],
                ontap: () => _controller.onSelectedInterest(i),
              ),
              SpaceWidget(width: 7),
              Expanded(
                child: ParentButtonWidget(
                  label: _controller.interests[i + 1],
                  isSelected: _controller.isSelectedInterest[i + 1],
                  ontap: () => _controller.onSelectedInterest(i + 1),
                ),
              ),
            ],
          ),
        SpaceWidget(height: 30),
        BulletTextWidget(text: AppStrings.valuesLifeStyle),
        SpaceWidget(height: 10),
        for (int i = 0; i < _controller.valuesLifeStyle.length - 2; i = i + 2)
          Row(
            children: [
              ParentButtonWidget(
                label: _controller.valuesLifeStyle[i],
                isSelected: _controller.isSelectedValuesLifeStyle[i],
                ontap: () => _controller.onSelectedValuesLifeStyle(i),
              ),
              SpaceWidget(width: 7),
              Expanded(
                child: ParentButtonWidget(
                  label: _controller.valuesLifeStyle[i + 1],
                  isSelected: _controller.isSelectedValuesLifeStyle[i + 1],
                  ontap: () => _controller.onSelectedValuesLifeStyle(i + 1),
                ),
              ),
            ],
          ),
        Align(
          alignment: Alignment.centerLeft,
          child: ParentButtonWidget(
            label: _controller.valuesLifeStyle[4],
            isSelected: _controller.isSelectedValuesLifeStyle[4],
            ontap: () => _controller.onSelectedValuesLifeStyle(4),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ParentButtonWidget(
            label: _controller.valuesLifeStyle[5],
            isSelected: _controller.isSelectedValuesLifeStyle[5],
            ontap: () => _controller.onSelectedValuesLifeStyle(5),
          ),
        ),
      ],

      onTap: _controller.onNext,
      onUpdate: _controller.onUpdate,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_strings.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/auth_screen_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class WhatEnjoyAsParent extends StatelessWidget {
  const WhatEnjoyAsParent({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget.header(text: AppStrings.whatYouEnjoyOrValueAsParent),
          SpaceWidget(height: 20),
          TextWidget.blackLight(text: AppStrings.checkAnyThatReflect),
          SpaceWidget(height: 20),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.circle, size: 10),
                title: TextWidget.black(
                  textAlign: TextAlign.left,
                  text: AppStrings.interestWhatyouEnjoyWithChild,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ButtonWidget.normal(
                  text: AppStrings.natureWalks,

                  ontap: () {},
                ),
              ),
              Expanded(
                child: ButtonWidget.normal(
                  text: AppStrings.natureWalks,
                  ontap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

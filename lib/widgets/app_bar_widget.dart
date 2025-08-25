import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_icons.dart';
import 'package:red_tangerine/widgets/app_background_widget.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.body});
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconWidget.custom(
                icon: AppIcons.splashIcon,
                width: 12,
                height: 5,
              ),
              Spacer(),
              IconWidget(icon: AppIcons.notificationIcon),
              SpaceWidget(width: 10),
              IconWidget(icon: AppIcons.settingIcon),
            ],
          ),
          SpaceWidget(height: 20),
          ...body,
        ],
      ),
    );
  }
}

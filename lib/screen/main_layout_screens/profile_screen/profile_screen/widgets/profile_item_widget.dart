import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/icon_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final String icon;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconWidget.custom(
                icon: icon,
                height: 4,
                width: 4,
                color: AppColors.orange,
              ),
              SpaceWidget(width: 10),
              TextWidget(
                text: text,
                fontColor: AppColors.grey_700,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, size: 15),
            ],
          ),
          SpaceWidget(height: 10),
        ],
      ),
    );
  }
}

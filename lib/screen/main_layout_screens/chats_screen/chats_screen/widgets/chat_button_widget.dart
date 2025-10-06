import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';

class ChatButtonWidget extends StatelessWidget {
  const ChatButtonWidget({
    super.key,
    required this.label,
    required this.isActive,
    required this.ontap,
  });

  final bool isActive;
  final String label;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return ButtonWidget.normal(
      text: label,
      ontap: ontap,
      margin: EdgeInsets.all(0),
      fontSize: 12,
      borderColor: AppColors.orange,
      backgroundColor: isActive ? AppColors.orange : AppColors.white,
      textColor: !isActive ? AppColors.grey_700 : AppColors.white,
      height: 28,
      width: 30,
    );
  }
}

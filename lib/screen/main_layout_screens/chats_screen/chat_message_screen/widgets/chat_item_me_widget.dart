import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ChatItemMeWidget extends StatelessWidget {
  const ChatItemMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white_500,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: TextWidget.blackLight(
            text: 'How are you?',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

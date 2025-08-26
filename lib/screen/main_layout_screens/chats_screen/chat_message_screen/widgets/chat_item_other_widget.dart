import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/constant/app_images.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class ChatItemOtherWidget extends StatelessWidget {
  const ChatItemOtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(AppDevImages.chatSampleImage1),
        ),
        SpaceWidget(width: 5),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.red_900,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: TextWidget.white(
            text: 'How are you?',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class MessageBoxWidget extends StatelessWidget {
  const MessageBoxWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: controller,
          maxLines: 10,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            hintText: "Type your intro here...",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.white_700),
            ),
          ),
        ),
      ],
    );
  }
}

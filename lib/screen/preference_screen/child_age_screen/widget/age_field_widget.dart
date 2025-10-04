import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class AgeFieldWidget extends StatelessWidget {
  const AgeFieldWidget({
    super.key,
    required this.hintText,

    required this.controller,
    required this.index,
    required this.focusNode,
    required this.onChange,
  });
  final String hintText;
  final int index;
  final List<FocusNode> focusNode;
  final TextEditingController controller;
  final void Function() onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      margin: EdgeInsets.only(right: index == 1 || index == 3 ? 30 : 5),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        focusNode: focusNode[index],
        onChanged: (value) {
          if (index == 7) {
            onChange();
            return;
          }
          FocusScope.of(context).requestFocus(focusNode[index + 1]);
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.white_700),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white_700),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white_700),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.orangeLight),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class AgeFieldWidget extends StatelessWidget {
  const AgeFieldWidget({
    super.key,
    required this.hintText,
    required this.onValidate,
    required this.focusNode1,
    required this.focusNode2,
    required this.controller,
  });
  final String hintText;
  final String? Function(String? value) onValidate;
  final FocusNode focusNode1;
  final FocusNode focusNode2;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        validator: (value) => onValidate(value),
        textAlign: TextAlign.center,
        focusNode: focusNode1,
        onChanged: (value) => FocusScope.of(context).requestFocus(focusNode2),
        decoration: InputDecoration(
          hintText: hintText,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white_700),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white_700),
          ),
        ),
      ),
    );
  }
}

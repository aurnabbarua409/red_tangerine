import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/utils/responsive_size.dart';

class CustomOtpWidget extends StatelessWidget {
  const CustomOtpWidget({super.key, required this.onSubmit});
  final void Function(String value) onSubmit;
  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      borderWidth: 2,
      borderColor: AppColors.grey_900,
      focusedBorderColor: AppColors.grey_900,
      showFieldAsBox: true,
      fieldWidth: ResponsiveSize.width(12),
      fieldHeight: ResponsiveSize.width(12),
      borderRadius: BorderRadius.circular(100),
      decoration: InputDecoration(
        counterText: "",
        fillColor: Colors.white,
        focusColor: AppColors.grey_900,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
      ),
      onSubmit: (value) {
        onSubmit(value);
      },
    );
  }
}

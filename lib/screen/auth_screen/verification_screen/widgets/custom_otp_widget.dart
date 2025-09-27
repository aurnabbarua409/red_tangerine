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
      fieldWidth: ResponsiveSize.width(12),
      fieldHeight: ResponsiveSize.width(12),
      decoration: InputDecoration(
        counterText: "",
        fillColor: Colors.white,
        focusColor: AppColors.grey_900,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey_900, width: 2),
        ),
      ),
      onSubmit: (value) {
        onSubmit(value);
      },
    );
  }
}

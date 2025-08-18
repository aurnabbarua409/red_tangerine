import 'package:flutter/material.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class DropDownButtonFormFieldWidget extends StatelessWidget {
  const DropDownButtonFormFieldWidget({
    super.key,
    required this.items,
    required this.onChanged,
  });
  final List<DropdownMenuItem>? items;
  final void Function(dynamic value) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey_900),
          borderRadius: BorderRadius.circular(25),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
      ),
      items: items,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}

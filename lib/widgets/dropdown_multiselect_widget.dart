import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:red_tangerine/constant/app_colors.dart';

class DropdownMultiselectWidget extends StatelessWidget {
  const DropdownMultiselectWidget({
    super.key,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
  });
  final List<String> options;
  final List<String> selectedValues;
  final void Function(List<String> value) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
      options: options,
      selectedValues: selectedValues.toList(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: AppColors.grey_900),
        ),
      ),
      separator: ' | ',
      onChanged: onChanged,
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final int? minLines;
  final int? maxLines;
  final bool? obscureText;
  final String hint;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.obscureText,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      minLines: minLines,
      maxLines: maxLines,

      obscureText: obscureText ?? false,
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: AppColors.primary400,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: AppColors.secondary),
        hintText: hint.tr(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.natural400, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.natural400, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primary400, width: 2),
        ),
      ),
    );
  }
}

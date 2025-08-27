import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'app_text.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textColor;

  final VoidCallback onTap;
  const AppPrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color ?? AppColors.primary400,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        child: Center(
          child: AppText(
            text: 'continue',
            color: textColor ?? AppColors.natural100,
            fontSize: 14,
            fontWeight: 600,
          ),
        ),
      ),
    );
  }
}

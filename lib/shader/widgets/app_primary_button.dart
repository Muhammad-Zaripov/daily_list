import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'animated_circular_progress.dart';
import 'app_text.dart';

class AppPrimaryButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textColor;
  final bool? isLoading;
  final VoidCallback onTap;
  const AppPrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color,
    this.textColor,
    this.isLoading,
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
          child: (isLoading ?? false)
              ? Row(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: title,
                      color: textColor ?? AppColors.natural100,
                      fontSize: 14,
                      fontWeight: 600,
                    ),
                    AnimatedCircularProgress(
                      size: 20,
                      strokeWidth: 1,
                      dotSize: 4,
                      progressColor: AppColors.natural100,
                      backgroundColor: AppColors.primary600,
                    ),
                  ],
                )
              : AppText(
                  text: title,
                  color: textColor ?? AppColors.natural100,
                  fontSize: 14,
                  fontWeight: 600,
                ),
        ),
      ),
    );
  }
}

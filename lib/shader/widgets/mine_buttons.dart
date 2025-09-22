import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'app_text.dart';

class MineButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const MineButtons({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.natural100,
          border: Border.all(
            width: 1,
            color: isSelected ? AppColors.primary400 : AppColors.natural400,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: AppText(text: title),
      ),
    );
  }
}

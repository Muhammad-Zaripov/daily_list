import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'app_text.dart';

class MineButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MineButtons({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.natural400),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: AppText(text: title),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ProfileContainerWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const ProfileContainerWidget({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.natural100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppColors.natural400),
        ),
        child: child,
      ),
    );
  }
}

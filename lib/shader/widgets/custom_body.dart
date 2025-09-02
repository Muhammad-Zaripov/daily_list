import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CustomBody extends StatelessWidget {
  final Widget child;
  const CustomBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.natural100,
        border: Border(top: BorderSide(width: 1, color: AppColors.natural400)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}

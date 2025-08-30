import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      top: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              Image.asset(AppAssets.logo, width: 33, height: 33),
              AppText(
                text: 'Daily List',
                isLocalizedKey: false,
                fontSize: 20,
                fontWeight: 600,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.natural400),
                color: AppColors.natural100,
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppAssets.notification, width: 24, height: 24),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../shader/widgets/app_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      top: 65,
      child: Row(
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
    );
  }
}

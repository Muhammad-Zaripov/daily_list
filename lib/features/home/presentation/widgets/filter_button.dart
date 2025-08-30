import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_padding_widget.dart';
import '../../../../shader/widgets/app_text.dart';
import 'filters_bottom_sheet.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      top: 20,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => FiltersBottomSheet(),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.natural400),
            color: AppColors.natural100,
          ),
          child: Row(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppAssets.filter),
              AppText(text: 'filters', color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}

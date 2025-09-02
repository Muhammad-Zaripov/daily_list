import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime currentDate;
  final List<String> months;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const CalendarHeader({
    super.key,
    required this.currentDate,
    required this.months,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8,
                children: [
                  AppText(text: months[currentDate.month - 1], fontSize: 20),
                  AppText(
                    text: '${currentDate.year}',
                    fontSize: 20,
                    isLocalizedKey: false,
                  ),
                ],
              ),
            ],
          ),
          Row(
            spacing: 24,
            children: [
              GestureDetector(
                onTap: onPrevious,
                child: SvgPicture.asset(
                  AppAssets.left,
                  color: AppColors.primary,
                ),
              ),
              GestureDetector(
                onTap: onNext,
                child: SvgPicture.asset(
                  AppAssets.right,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

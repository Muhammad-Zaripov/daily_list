import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class WeekDaysRow extends StatelessWidget {
  final List<String> weekDays;
  const WeekDaysRow({super.key, required this.weekDays});

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      child: Row(
        children: weekDays
            .map(
              (day) => Expanded(
                child: Center(
                  child: AppText(
                    text: day,
                    fontSize: 16,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

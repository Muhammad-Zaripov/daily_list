import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_primary_button.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../shader/widgets/mine_buttons.dart';

class FiltersBottomSheet extends StatelessWidget {
  const FiltersBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.natural100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(text: 'filters', fontSize: 20, fontWeight: 600),
          20.g,
          AppText(text: 'priority', fontSize: 16, fontWeight: 600),
          16.g,
          Wrap(
            runSpacing: 16,
            spacing: 16,
            children: [
              MineButtons(title: 'high', onTap: () {}),
              MineButtons(title: 'medium', onTap: () {}),
              MineButtons(title: 'low', onTap: () {}),
              MineButtons(title: 'no_priority', onTap: () {}),
            ],
          ),
          24.g,
          AppText(text: 'status', fontSize: 16, fontWeight: 600),
          16.g,
          Row(
            spacing: 16,
            children: [
              MineButtons(title: 'on_progress', onTap: () {}),
              MineButtons(title: 'complete', onTap: () {}),
            ],
          ),
          24.g,
          AppPrimaryButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: 'apply',
          ),
          20.g,
        ],
      ),
    );
  }
}

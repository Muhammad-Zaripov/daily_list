import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';
import '../../../../shader/widgets/delete_dialog.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => DeleteDialog(),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.mediumTurquoise100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'User research',
              isLocalizedKey: false,
              fontSize: 16,
              fontWeight: 600,
            ),
            8.g,
            AppText(
              text:
                  'Objective: To identify the characteristics, needs, and behaviors of the primary application users',
              isLocalizedKey: false,
              maxLines: 4,
              softWrap: true,
              textAlign: TextAlign.start,
              color: AppColors.secondary,
            ),
            Spacer(),
            AppText(text: 'today', fontSize: 12, color: AppColors.secondary),
          ],
        ),
      ),
    );
  }
}

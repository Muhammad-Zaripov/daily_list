import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';
import '../../../../shader/widgets/delete_dialog.dart';

class NoteWidget extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const NoteWidget({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => DeleteDialog(
            title: 'confirm_delete',
            description: 'delete_message_warning',
            onTap: () {},
          ),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              text: title,
              isLocalizedKey: false,
              fontSize: 16,
              fontWeight: 600,
            ),
            8.g,
            AppText(
              text: description,
              isLocalizedKey: false,
              maxLines: 5,
              softWrap: true,
              textAlign: TextAlign.start,
              color: AppColors.secondary,
            ),
            Spacer(),
            AppText(text: date, fontSize: 12, color: AppColors.secondary),
          ],
        ),
      ),
    );
  }
}

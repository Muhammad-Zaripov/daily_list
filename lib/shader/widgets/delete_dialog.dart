import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_primary_button.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.natural100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.delete),
            16.g,
            AppText(
              text: 'confirm_delete',
              fontSize: 20,
              fontWeight: 600,
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            4.g,
            AppText(
              text: 'delete_message_warning',
              maxLines: 2,
              textAlign: TextAlign.center,
              softWrap: true,
              color: AppColors.secondary,
            ),
            16.g,
            AppPrimaryButton(onTap: () {}, title: 'yes_delete'),
            12.g,
            AppPrimaryButton(
              onTap: () {
                Navigator.pop(context);
              },
              title: 'cancel',
              color: AppColors.natural100,
              textColor: AppColors.primary400,
            ),
          ],
        ),
      ),
    );
  }
}

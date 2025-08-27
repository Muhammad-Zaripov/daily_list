import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../../shader/widgets/animated_circular_progress.dart';
import '../../../../shader/widgets/app_primary_button.dart';
import '../widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.natural100,
      body: AppPaddingWidget(
        top: 80,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                AppAssets.logo,
                width: 84,
                height: 82,
                fit: BoxFit.cover,
              ),
            ),
            32.g,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: 'hey_there', fontSize: 28, fontWeight: 600),
                AppText(text: '👋🏻', fontSize: 28, fontWeight: 600),
              ],
            ),
            8.g,
            AppText(
              text: 'welcome_message',
              softWrap: true,
              textAlign: TextAlign.center,
              maxLines: 3,
              color: AppColors.secondary,
            ),
            48.g,
            CustomTextField(hint: 'email', controller: mailController),
            4.g,
            Row(
              children: [
                AppText(
                  text: 'example',
                  color: AppColors.secondary,
                  fontSize: 12,
                ),
                AppText(
                  text: ' dailylist@email.com',
                  color: AppColors.secondary,
                  fontSize: 12,
                ),
              ],
            ),
            24.g,
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: mailController,
              builder: (context, value, _) {
                final isNotEmpty = value.text.trim().isNotEmpty;
                return AppPrimaryButton(
                  onTap: () {},
                  color: isNotEmpty
                      ? AppColors.primary400
                      : AppColors.natural300,
                  textColor: isNotEmpty
                      ? AppColors.natural100
                      : AppColors.secondary,
                  title: 'continue',
                );
              },
            ),
            AnimatedCircularProgress(size: 30, strokeWidth: 2, dotSize: 5),
          ],
        ),
      ),
    );
  }
}

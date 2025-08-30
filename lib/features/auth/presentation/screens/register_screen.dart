import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../../../../shader/widgets/app_primary_button.dart';
import '../../../../shader/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
            AppText(
              text: 'sign_up_to_achieve_more',
              fontSize: 28,
              fontWeight: 600,
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            8.g,
            AppText(
              text: 'sign_up_description',
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
                  isLocalizedKey: false,
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
            20.g,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 4,
              children: [
                AppText(text: 'have_an_account', color: AppColors.secondary),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: AppText(
                    text: 'sign_in_now',
                    fontWeight: 600,
                    color: AppColors.primary400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

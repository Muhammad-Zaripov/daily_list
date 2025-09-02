import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_primary_button.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final TextEditingController mailController;
  final TextEditingController passwordController;
  const AuthButton({
    super.key,
    required this.mailController,
    required this.passwordController,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: mailController,
      builder: (context, _, __) {
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: passwordController,
          builder: (context, __, ___) {
            final isNotEmpty =
                mailController.text.trim().isNotEmpty &&
                passwordController.text.trim().isNotEmpty;
            return AppPrimaryButton(
              onTap: () {
                if (isNotEmpty) {
                  onTap();
                }
              },
              color: isNotEmpty ? AppColors.primary400 : AppColors.natural300,
              textColor: isNotEmpty
                  ? AppColors.natural100
                  : AppColors.secondary,
              title: title,
            );
          },
        );
      },
    );
  }
}

import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../widgets/account_widget.dart';
import '../widgets/user_informations_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.natural200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 20,
              right: 20,
              bottom: 16,
            ),
            child: AppText(text: 'profile', fontSize: 20, fontWeight: 600),
          ),
          UserInformationsWidget(),
          16.g,
          AccountWidget(),
        ],
      ),
    );
  }
}

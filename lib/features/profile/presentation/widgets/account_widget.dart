import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/features/profile/data/models/account_model.dart';
import 'package:daily_list/features/profile/presentation/widgets/account_items.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';
import '../../../../shader/widgets/custom_body.dart';
import '../../../../shader/widgets/delete_dialog.dart';
import '../screens/edit_language_screen.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<AccountModel> list = [
      AccountModel(
        icon: AppAssets.infoLanguageOutline,
        title: 'language_options',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditLanguageScreen()),
          );
        },
      ),
      AccountModel(
        icon: AppAssets.infoSignOuOutline,
        title: 'sign_out',
        onTap: () {
          showAdaptiveDialog(
            context: context,
            builder: (context) => DeleteDialog(
              title: 'logout_title',
              description: 'logout_subtitle',
              onTap: () {},
            ),
          );
        },
      ),
    ];
    return Expanded(
      child: CustomBody(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: 'account', fontSize: 16, fontWeight: 600),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.natural400,
                  ),
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return AccountItems(item: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

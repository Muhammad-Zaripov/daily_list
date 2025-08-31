import 'package:daily_list/features/profile/data/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../shader/widgets/app_text.dart';

class AccountItems extends StatelessWidget {
  final AccountModel item;
  const AccountItems({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 8,
              children: [
                SvgPicture.asset(item.icon, width: 24, height: 24),
                AppText(text: item.title),
              ],
            ),
            SvgPicture.asset(AppAssets.right),
          ],
        ),
      ),
    );
  }
}

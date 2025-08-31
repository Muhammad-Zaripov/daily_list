import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';
import '../screens/edit_profile_screen.dart';
import 'profile_container_widget.dart';

class UserInformationsWidget extends StatelessWidget {
  const UserInformationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      child: ProfileContainerWidget(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfileScreen()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 12,
              children: [
                SvgPicture.asset(AppAssets.defoultProfile),
                Column(
                  spacing: 2,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Muhammad',
                      isLocalizedKey: false,
                      fontSize: 16,
                    ),
                    AppText(
                      text: 'mzaripov931@gmail.com',
                      isLocalizedKey: false,
                      fontSize: 12,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(AppAssets.actionEditOutline),
          ],
        ),
      ),
    );
  }
}

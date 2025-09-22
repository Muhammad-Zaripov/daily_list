import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../screens/edit_profile_screen.dart';
import 'profile_container_widget.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart'; // AuthBloc import qilamiz

class UserInformationsWidget extends StatelessWidget {
  const UserInformationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String name = "";
        String email = "";

        state.maybeWhen(
          authenticated: (user) {
            name = user.name!;
            email = user.email;
          },
          orElse: () {},
        );

        return AppPaddingWidget(
          child: ProfileContainerWidget(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
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
                          text: name,
                          // isLocalizedKey: false,
                          fontSize: 16,
                        ),
                        AppText(
                          text: email,
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
      },
    );
  }
}

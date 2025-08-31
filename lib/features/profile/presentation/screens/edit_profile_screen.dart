import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/features/profile/presentation/widgets/profile_container_widget.dart';
import 'package:daily_list/shader/widgets/app_primary_button.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:daily_list/shader/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/custom_body.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.natural200,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_sharp),
        ),
        centerTitle: true,
        title: AppText(text: 'edit_profile'),
        backgroundColor: AppColors.natural200,
      ),
      body: CustomBody(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: 'profile_image'),
              16.g,
              ProfileContainerWidget(
                onTap: () {},
                child: Row(
                  spacing: 20,
                  children: [
                    SvgPicture.asset(AppAssets.defoultProfile),
                    AppText(
                      text: 'change_image',
                      fontSize: 16,
                      fontWeight: 600,
                      color: AppColors.primary400,
                    ),
                  ],
                ),
              ),
              16.g,
              CustomTextField(
                hint: 'name',
                controller: nameController,
                maxLines: 1,
              ),
              16.g,
              CustomTextField(
                hint: 'email',
                controller: emailController,
                maxLines: 1,
              ),
              Spacer(),
              AppPrimaryButton(onTap: () {}, title: 'update'),
              20.g,
            ],
          ),
        ),
      ),
    );
  }
}

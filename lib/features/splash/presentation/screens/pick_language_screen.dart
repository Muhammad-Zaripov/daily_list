import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/core/extensions/media_query_values_extension.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:daily_list/shader/widgets/language_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shader/models/language_model.dart';
import '../../../../shader/widgets/app_padding_widget.dart';
import '../../../../shader/widgets/app_primary_button.dart';
import '../../../onbording/presentation/screens/onbording_screen.dart';

class PickLanguageScreen extends StatefulWidget {
  const PickLanguageScreen({super.key});

  @override
  State<PickLanguageScreen> createState() => _PickLanguageScreenState();
}

class _PickLanguageScreenState extends State<PickLanguageScreen> {
  String selected = "";
  final languages = [
    LanguageModel(code: "en", name: "English", flag: "🇺🇸"),
    LanguageModel(code: "uz", name: "O'zbek", flag: "🇺🇿"),
    LanguageModel(code: "ru", name: "Russia", flag: "🇷🇺"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.natural100,
      body: AppPaddingWidget(
        bottom: 50,
        top: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'pick_your_language',
              fontSize: 24,
              fontWeight: 600,
              color: AppColors.primary,
            ),
            8.g,
            AppText(
              text: 'choose_language',
              fontSize: 14,
              color: AppColors.secondary,
              softWrap: true,
              maxLines: 2,
            ),
            SizedBox(
              height: context.h(0.4),
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  return LanguageTile(
                    language: lang,
                    selectedCode: selected,
                    onChanged: (code) {
                      setState(() {
                        selected = code;
                      });
                    },
                  );
                },
              ),
            ),
            const Spacer(),
            AppPrimaryButton(
              onTap: () {
                if (selected.isNotEmpty) {
                  context.setLocale(Locale(selected));
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()),
                );
              },
              color: selected.isNotEmpty
                  ? AppColors.primary400
                  : AppColors.natural300,
              textColor: selected.isNotEmpty
                  ? AppColors.natural100
                  : AppColors.secondary,
              title: 'continue',
            ),
          ],
        ),
      ),
    );
  }
}

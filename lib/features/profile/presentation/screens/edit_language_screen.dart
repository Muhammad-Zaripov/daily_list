import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/models/language_model.dart';
import '../../../../shader/widgets/app_primary_button.dart';
import '../../../../shader/widgets/custom_body.dart';
import '../../../../shader/widgets/language_tile.dart';

class EditLanguageScreen extends StatefulWidget {
  const EditLanguageScreen({super.key});

  @override
  State<EditLanguageScreen> createState() => _EditLanguageScreenState();
}

class _EditLanguageScreenState extends State<EditLanguageScreen> {
  String selected = "";
  final languages = [
    LanguageModel(code: "en", name: "English", flag: "🇺🇸"),
    LanguageModel(code: "uz", name: "O'zbek", flag: "🇺🇿"),
    LanguageModel(code: "ru", name: "Russia", flag: "🇷🇺"),
  ];
  @override
  Widget build(BuildContext context) {
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
            children: [
              Expanded(
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
                    Navigator.pop(context);
                  }
                },
                color: selected.isNotEmpty
                    ? AppColors.primary400
                    : AppColors.natural300,
                textColor: selected.isNotEmpty
                    ? AppColors.natural100
                    : AppColors.secondary,
                title: 'continue',
              ),
              20.g,
            ],
          ),
        ),
      ),
    );
  }
}

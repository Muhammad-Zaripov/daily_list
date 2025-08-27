import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../models/language_model.dart';
import 'app_text.dart';

class LanguageTile extends StatelessWidget {
  final LanguageModel language;
  final String selectedCode;
  final Function(String) onChanged;

  const LanguageTile({
    super.key,
    required this.language,
    required this.selectedCode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedCode == language.code;
    return GestureDetector(
      onTap: () => onChanged(language.code),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : AppColors.natural100,
          border: Border.all(
            width: 1,
            color: isSelected ? AppColors.primary400 : AppColors.natural400,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(language.flag),
            12.g,
            Expanded(
              child: AppText(
                text: language.name,
                fontSize: 16,
                color: AppColors.primary,
              ),
            ),
            Transform.scale(
              scale: 1.3,
              child: Radio<String>(
                side: BorderSide(color: AppColors.secondary),
                value: language.code,
                groupValue: selectedCode,
                onChanged: (val) => onChanged(val!),
                activeColor: AppColors.primary400,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

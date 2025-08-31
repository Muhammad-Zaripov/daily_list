import 'package:daily_list/features/note/data/model/layout_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';

class LayoutTile extends StatelessWidget {
  final String selected;
  final LayoutModel item;
  final Function(String) onChanged;
  const LayoutTile({
    super.key,
    required this.item,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == item.layout;
    return GestureDetector(
      onTap: () {
        onChanged(item.layout);
        Navigator.pop(context);
      },
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(text: item.title),
            Transform.scale(
              scale: 1.3,
              child: Radio<String>(
                side: BorderSide(color: AppColors.secondary),
                value: item.layout,
                groupValue: selected,
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

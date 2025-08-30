import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../shader/widgets/app_text.dart';
import '../screens/note_settings_screen.dart';

class NoteHeader extends StatelessWidget {
  const NoteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(text: 'note', fontSize: 20, fontWeight: 600),
        Row(
          spacing: 12,
          children: [
            SvgPicture.asset(AppAssets.actionTrashOutline),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoteSettingsScreen()),
                );
              },
              child: SvgPicture.asset(AppAssets.actionOptionOutline),
            ),
          ],
        ),
      ],
    );
  }
}

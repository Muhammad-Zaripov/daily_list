import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../shader/widgets/app_text.dart';
import '../screens/note_settings_screen.dart';
import '../../data/model/note_view_type.dart';

class NoteHeader extends StatelessWidget {
  final Function(NoteViewType) onViewTypeChanged;
  const NoteHeader({super.key, required this.onViewTypeChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(text: 'note', fontSize: 20, fontWeight: 600),
        Row(
          children: [
            SvgPicture.asset(AppAssets.actionTrashOutline),
            GestureDetector(
              onTap: () async {
                final result = await Navigator.push<NoteViewType>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoteSettingsScreen(),
                  ),
                );

                if (result != null) {
                  onViewTypeChanged(result);
                }
              },
              child: SvgPicture.asset(AppAssets.actionOptionOutline),
            ),
          ],
        ),
      ],
    );
  }
}

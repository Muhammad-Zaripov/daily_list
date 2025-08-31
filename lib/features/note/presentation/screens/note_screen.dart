import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:daily_list/shader/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../widgets/note_grid.dart';
import '../widgets/note_header.dart';
import '../../data/model/note_view_type.dart';
import '../widgets/note_list.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteViewType _viewType = NoteViewType.grid;

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.natural200,
      body: AppPaddingWidget(
        top: 70,
        child: Column(
          children: [
            NoteHeader(
              onViewTypeChanged: (type) {
                setState(() {
                  _viewType = type;
                });
              },
            ),
            24.g,
            CustomTextField(
              hint: 'search_note',
              controller: searchController,
              maxLines: 1,
            ),
            24.g,
            Expanded(
              child: _viewType == NoteViewType.grid
                  ? const NoteGrid()
                  : const NoteList(),
            ),
          ],
        ),
      ),
    );
  }
}

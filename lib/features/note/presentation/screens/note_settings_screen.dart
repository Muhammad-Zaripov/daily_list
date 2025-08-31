import 'package:daily_list/features/note/data/model/layout_model.dart';
import 'package:daily_list/features/note/data/model/note_view_type.dart';
import 'package:daily_list/shader/widgets/custom_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';
import '../widgets/layout_tile.dart';

class NoteSettingsScreen extends StatefulWidget {
  const NoteSettingsScreen({super.key});

  @override
  State<NoteSettingsScreen> createState() => _NoteSettingsScreenState();
}

class _NoteSettingsScreenState extends State<NoteSettingsScreen> {
  String selected = "";
  List<LayoutModel> list = [
    LayoutModel(title: 'list_card', layout: 'grid'),
    LayoutModel(title: 'list_view', layout: 'list'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.natural200,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, _mapLayoutToViewType(selected));
          },
          child: const Icon(Icons.arrow_back_sharp),
        ),
        centerTitle: true,
        title: const AppText(text: 'note_setting'),
        backgroundColor: AppColors.natural200,
      ),
      body: CustomBody(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppText(text: 'layout', fontSize: 16, fontWeight: 600),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return LayoutTile(
                      item: item,
                      selected: selected,
                      onChanged: (layout) {
                        setState(() {
                          selected = layout;
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  NoteViewType _mapLayoutToViewType(String layout) {
    return layout == "list" ? NoteViewType.list : NoteViewType.grid;
  }
}

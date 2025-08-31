import 'package:daily_list/features/note/presentation/widgets/note_widget.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: NoteWidget(
          title: 'User research $index',
          description:
              'Objective: To identify the characteristics, needs, and behaviors of the primary application users $index',
          date: 'today',
        ),
      ),
    );
  }
}

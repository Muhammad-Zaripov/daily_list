import 'package:flutter/material.dart';
import 'note_widget.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 16 / 19,
      ),
      itemBuilder: (context, index) {
        return NoteWidget(
          title: 'User research $index',
          description:
              'Objective: To identify the characteristics, needs, and behaviors of the primary application users $index',
          date: 'today',
        );
      },
    );
  }
}

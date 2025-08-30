import 'package:flutter/material.dart';
import 'note_widget.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return NoteWidget();
        },
      ),
    );
  }
}

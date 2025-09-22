import 'package:flutter/material.dart';

import '../../../../shader/widgets/mine_buttons.dart';

class CategoryStatusItems extends StatefulWidget {
  final List<String> items;
  const CategoryStatusItems({super.key, required this.items});

  @override
  State<CategoryStatusItems> createState() => _CategoryStatusItemsState();
}

class _CategoryStatusItemsState extends State<CategoryStatusItems> {
  int selectedCategory = 0;
  int selectedPriority = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.items.length, (index) {
          return MineButtons(
            title: widget.items[index],
            isSelected: selectedCategory == index,
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
          );
        }),
      ),
    );
  }
}

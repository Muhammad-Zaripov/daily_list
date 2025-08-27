import 'package:flutter/material.dart';

class AppPaddingWidget extends StatelessWidget {
  final double? top;
  final double? bottom;
  final Widget child;
  const AppPaddingWidget({
    super.key,
    required this.child,
    this.top,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ),
      child: child,
    );
  }
}

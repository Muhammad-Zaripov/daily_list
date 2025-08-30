import 'package:flutter/material.dart';

class DetailModel {
  final int index;
  final String title;
  final String icon;
  final VoidCallback onTap;
  DetailModel({
    required this.icon,
    required this.index,
    required this.onTap,
    required this.title,
  });
}

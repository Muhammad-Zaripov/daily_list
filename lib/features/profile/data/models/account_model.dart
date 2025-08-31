import 'package:flutter/material.dart';

class AccountModel {
  final String title;
  final String icon;
  final VoidCallback onTap;
  AccountModel({required this.icon, required this.title, required this.onTap});
}

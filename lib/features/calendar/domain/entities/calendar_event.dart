import 'package:flutter/material.dart';

class CalendarEvent {
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final Color color;
  final String? description;

  CalendarEvent({
    required this.title,
    required this.startTime,
    required this.endTime,
    this.color = Colors.blue,
    this.description,
  });
}

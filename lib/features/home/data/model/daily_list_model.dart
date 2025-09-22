import 'package:cloud_firestore/cloud_firestore.dart';

enum TaskStatus { onProgress, complete }

enum Priority { low, medium, high }

class DailyListModel {
  final String id;
  final String title;
  final String subtitle;
  final DateTime dueDate;
  final Priority priority;
  final TaskStatus status;
  final String userId;

  DailyListModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.dueDate,
    required this.priority,
    required this.status,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'due_date': dueDate,
      'priority': priority.name,
      'status': status.name,
      'user_id': userId,
    };
  }

  factory DailyListModel.fromJson(Map<String, dynamic> json, String id) {
    return DailyListModel(
      id: id,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      dueDate: (json['due_date'] as Timestamp).toDate(),
      priority: Priority.values.firstWhere((e) => e.name == json['priority']),
      status: TaskStatus.values.firstWhere((e) => e.name == json['status']),
      userId: json['user_id'],
    );
  }
}

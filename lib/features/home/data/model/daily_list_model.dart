enum TaskStatus { onProgress, complete }

enum Priority { low, medium, high }

class DailyListModel {
  final String id;
  final String title;
  final String subtitle;
  final DateTime dueDate;
  final Priority? priority;
  final TaskStatus status;

  DailyListModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.dueDate,
    this.priority,
    required this.status,
  });
}

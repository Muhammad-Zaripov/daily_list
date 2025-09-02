import 'package:injectable/injectable.dart';
import '../entities/calendar_event.dart';

typedef OnDateSelected = void Function(DateTime date);

@singleton
class CalendarService {
  final List<CalendarEvent> _events = [];

  List<CalendarEvent> get events => _events;

  void addEvent(CalendarEvent event) => _events.add(event);
  void removeEvent(CalendarEvent event) => _events.remove(event);
  void clearEvents() => _events.clear();

  List<CalendarEvent> getEventsForDay(DateTime day) {
    return _events.where((event) => isSameDay(event.startTime, day)).toList();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  int getEventsCountForMonth(int year, int month) {
    return _events
        .where(
          (event) =>
              event.startTime.year == year && event.startTime.month == month,
        )
        .length;
  }
}

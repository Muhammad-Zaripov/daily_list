import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:flutter/material.dart';
import '../../domain/services/calendar_service.dart';
import 'day_tile.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime currentDate;
  final DateTime? selectedDate;
  final CalendarService calendarService;
  final ValueChanged<DateTime> onDaySelected;

  const CalendarGrid({
    super.key,
    required this.currentDate,
    required this.selectedDate,
    required this.calendarService,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(
      currentDate.year,
      currentDate.month + 1,
      0,
    ).day;
    final firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    final startingWeekday = firstDayOfMonth.weekday == 7
        ? 0
        : firstDayOfMonth.weekday;

    List<Widget> dayWidgets = [];
    final previousMonth = DateTime(currentDate.year, currentDate.month - 1);
    final daysInPreviousMonth = DateTime(
      previousMonth.year,
      previousMonth.month + 1,
      0,
    ).day;

    for (int i = startingWeekday - 1; i >= 0; i--) {
      dayWidgets.add(
        DayTile(
          day: daysInPreviousMonth - i,
          isPreviousMonth: true,
          currentDate: currentDate,
          selectedDate: selectedDate,
          calendarService: calendarService,
          onDaySelected: onDaySelected,
        ),
      );
    }

    for (int day = 1; day <= daysInMonth; day++) {
      dayWidgets.add(
        DayTile(
          day: day,
          currentDate: currentDate,
          selectedDate: selectedDate,
          calendarService: calendarService,
          onDaySelected: onDaySelected,
        ),
      );
    }

    int remainingCells = 42 - dayWidgets.length;
    for (int day = 1; day <= remainingCells; day++) {
      dayWidgets.add(
        DayTile(
          day: day,
          isNextMonth: true,
          currentDate: currentDate,
          selectedDate: selectedDate,
          calendarService: calendarService,
          onDaySelected: onDaySelected,
        ),
      );
    }

    return AppPaddingWidget(
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 7,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 1.0,
        children: dayWidgets,
      ),
    );
  }
}

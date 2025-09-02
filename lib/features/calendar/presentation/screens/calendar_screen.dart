import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../../domain/services/calendar_service.dart';
import '../widgets/calendar_header.dart';
import '../widgets/calendart_grid.dart';
import '../widgets/events_list.dart';
import '../widgets/week_days_row.dart';

class CalendarPage extends StatefulWidget {
  final CalendarService calendarService;
  final OnDateSelected? onDateSelected;
  final DateTime? initialSelectedDate;

  const CalendarPage({
    super.key,
    required this.calendarService,
    this.onDateSelected,
    this.initialSelectedDate,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _currentDate;
  DateTime? _selectedDate;

  final weekDays = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
  final months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec',
  ];

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _selectedDate = widget.initialSelectedDate ?? DateTime.now();
  }

  void _previousMonth() => setState(
    () => _currentDate = DateTime(_currentDate.year, _currentDate.month - 1),
  );
  void _nextMonth() => setState(
    () => _currentDate = DateTime(_currentDate.year, _currentDate.month + 1),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.natural200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppPaddingWidget(
            top: 70,
            bottom: 24,
            child: AppText(text: 'calendar', fontSize: 20, fontWeight: 600),
          ),
          CalendarHeader(
            currentDate: _currentDate,
            months: months,
            onPrevious: _previousMonth,
            onNext: _nextMonth,
          ),
          16.g,
          WeekDaysRow(weekDays: weekDays),
          8.g,
          CalendarGrid(
            currentDate: _currentDate,
            selectedDate: _selectedDate,
            calendarService: widget.calendarService,
            onDaySelected: (date) {
              setState(() => _selectedDate = date);
              widget.onDateSelected?.call(date);
            },
          ),
          16.g,
          Expanded(
            child: EventsList(
              selectedDate: _selectedDate,
              calendarService: widget.calendarService,
              onEventRemoved: (event) =>
                  setState(() => widget.calendarService.removeEvent(event)),
            ),
          ),
        ],
      ),
    );
  }
}

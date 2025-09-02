import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';
import '../../domain/services/calendar_service.dart';

class DayTile extends StatelessWidget {
  final int day;
  final bool isPreviousMonth;
  final bool isNextMonth;
  final DateTime currentDate;
  final DateTime? selectedDate;
  final CalendarService calendarService;
  final ValueChanged<DateTime> onDaySelected;

  const DayTile({
    super.key,
    required this.day,
    this.isPreviousMonth = false,
    this.isNextMonth = false,
    required this.currentDate,
    required this.selectedDate,
    required this.calendarService,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final currentDay = isPreviousMonth
        ? DateTime(currentDate.year, currentDate.month - 1, day)
        : isNextMonth
        ? DateTime(currentDate.year, currentDate.month + 1, day)
        : DateTime(currentDate.year, currentDate.month, day);

    final isSelected =
        selectedDate != null &&
        calendarService.isSameDay(currentDay, selectedDate!);
    final isToday = calendarService.isSameDay(currentDay, DateTime.now());
    final hasEvents = calendarService.getEventsForDay(currentDay).isNotEmpty;
    final isCurrentMonth = !isPreviousMonth && !isNextMonth;

    return GestureDetector(
      onTap: () => onDaySelected(currentDay),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary400
              : isToday
              ? AppColors.primary100
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isToday && !isSelected
              ? Border.all(color: AppColors.primary400)
              : null,
        ),
        child: Stack(
          children: [
            Center(
              child: AppText(
                text: day.toString(),
                fontSize: 16,
                fontWeight: 600,
                color: isSelected
                    ? AppColors.natural100
                    : isCurrentMonth
                    ? AppColors.primary
                    : AppColors.secondary,
              ),
            ),
            if (hasEvents && isCurrentMonth)
              Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.natural100
                        : AppColors.primary400,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:daily_list/shader/widgets/custom_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/calendar_event.dart';
import '../../domain/services/calendar_service.dart';
import 'event_card.dart';

class EventsList extends StatelessWidget {
  final DateTime? selectedDate;
  final CalendarService calendarService;
  final ValueChanged<CalendarEvent> onEventRemoved;

  const EventsList({
    super.key,
    required this.selectedDate,
    required this.calendarService,
    required this.onEventRemoved,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedDate == null) return const SizedBox.shrink();
    final events = calendarService.getEventsForDay(selectedDate!);
    return CustomBody(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            events.isEmpty
                ? Expanded(
                    child: Center(
                      child: Column(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.noTask,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          AppText(text: 'no_task', color: AppColors.secondary),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) => EventCard(
                        event: events[index],
                        onRemove: () => onEventRemoved(events[index]),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

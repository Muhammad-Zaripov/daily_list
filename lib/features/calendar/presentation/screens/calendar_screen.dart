import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

// Function type'lar uchun typedef'lar - injectable bilan muammolar oldini olish uchun
typedef OnDateSelected = void Function(DateTime date);
typedef OnEventAdded = void Function(CalendarEvent event);

// Calendar Event modeli - oddiy class, injectable emas
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

// Calendar service - faqat bu injectable
@singleton
class CalendarService {
  final List<CalendarEvent> _events = [];

  List<CalendarEvent> get events => _events;

  // Event qo'shish
  void addEvent(CalendarEvent event) {
    _events.add(event);
  }

  // Event o'chirish
  void removeEvent(CalendarEvent event) {
    _events.remove(event);
  }

  // Barcha eventlarni tozalash
  void clearEvents() {
    _events.clear();
  }

  // Muayyan kun uchun eventlarni olish
  List<CalendarEvent> getEventsForDay(DateTime day) {
    return _events.where((event) {
      return isSameDay(event.startTime, day);
    }).toList();
  }

  // Ikki kun bir xilligini tekshirish
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Oy bo'yicha eventlar soni
  int getEventsCountForMonth(int year, int month) {
    return _events.where((event) {
      return event.startTime.year == year && event.startTime.month == month;
    }).length;
  }
}

// Asosiy Calendar Widget - injectable emas, oddiy StatefulWidget
class CustomUzbekCalendar extends StatefulWidget {
  final CalendarService calendarService;
  final OnDateSelected? onDateSelected;
  final DateTime? initialSelectedDate;

  const CustomUzbekCalendar({
    Key? key,
    required this.calendarService,
    this.onDateSelected,
    this.initialSelectedDate,
  }) : super(key: key);

  @override
  State<CustomUzbekCalendar> createState() => _CustomUzbekCalendarState();
}

class _CustomUzbekCalendarState extends State<CustomUzbekCalendar> {
  late DateTime _currentDate;
  DateTime? _selectedDate;

  // Hafta kunlari uzbekcha
  final List<String> _weekDaysUzbek = [
    'Yak',
    'Dush',
    'Sesh',
    'Chor',
    'Pay',
    'Jum',
    'Shan',
  ];

  // Oylar uzbekcha
  final List<String> _monthsUzbek = [
    'Yanvar',
    'Fevral',
    'Mart',
    'Aprel',
    'May',
    'Iyun',
    'Iyul',
    'Avgust',
    'Sentabr',
    'Oktabr',
    'Noyabr',
    'Dekabr',
  ];

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _selectedDate = widget.initialSelectedDate ?? DateTime.now();

    // Demo eventlar qo'shamiz
    _addDemoEvents();
  }

  // Demo eventlar qo'shish
  void _addDemoEvents() {
    widget.calendarService.addEvent(
      CalendarEvent(
        title: "Tadqiqot va rejalashtirish",
        startTime: DateTime(2024, 11, 22, 10, 0),
        endTime: DateTime(2024, 11, 22, 11, 0),
        color: Colors.purple,
        description: "Loyiha uchun tadqiqot ishlarini olib borish",
      ),
    );

    widget.calendarService.addEvent(
      CalendarEvent(
        title: "Uchrashuv",
        startTime: DateTime(2024, 11, 25, 14, 0),
        endTime: DateTime(2024, 11, 25, 15, 30),
        color: Colors.blue,
        description: "Jamoa bilan haftalik uchrashuv",
      ),
    );

    widget.calendarService.addEvent(
      CalendarEvent(
        title: "Dasturlash",
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 2)),
        color: Colors.green,
        description: "Flutter loyihasi ustida ishlash",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      top: 70,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildWeekDays(),
              const SizedBox(height: 10),
              _buildCalendar(),
              const SizedBox(height: 20),
              _buildEventsList(),
            ],
          ),
        ),
      ),
    );
  }

  // Calendar header - oy nomi va navigationlar
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kalendar',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            Text(
              '${_monthsUzbek[_currentDate.month - 1]} ${_currentDate.year}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Row(
          children: [
            _buildHeaderButton(Icons.chevron_left, _previousMonth),
            const SizedBox(width: 4),
            _buildHeaderButton(Icons.chevron_right, _nextMonth),
            const SizedBox(width: 8),
            _buildHeaderButton(Icons.settings_outlined, () {}),
          ],
        ),
      ],
    );
  }

  // Header button helper
  Widget _buildHeaderButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        color: Colors.grey[700],
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      ),
    );
  }

  // Hafta kunlari header
  Widget _buildWeekDays() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: _weekDaysUzbek.map((day) {
          return Expanded(
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Asosiy calendar grid
  Widget _buildCalendar() {
    final daysInMonth = DateTime(
      _currentDate.year,
      _currentDate.month + 1,
      0,
    ).day;
    final firstDayOfMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    final startingWeekday = firstDayOfMonth.weekday == 7
        ? 0
        : firstDayOfMonth.weekday;

    List<Widget> dayWidgets = [];

    // Oldingi oydan qolgan kunlar
    final previousMonth = DateTime(_currentDate.year, _currentDate.month - 1);
    final daysInPreviousMonth = DateTime(
      previousMonth.year,
      previousMonth.month + 1,
      0,
    ).day;

    for (int i = startingWeekday - 1; i >= 0; i--) {
      final day = daysInPreviousMonth - i;
      dayWidgets.add(_buildDayWidget(day, isPreviousMonth: true));
    }

    // Joriy oyning kunlari
    for (int day = 1; day <= daysInMonth; day++) {
      dayWidgets.add(_buildDayWidget(day));
    }

    // Keyingi oydan kerakli kunlar
    int remainingCells = 42 - dayWidgets.length;
    for (int day = 1; day <= remainingCells; day++) {
      dayWidgets.add(_buildDayWidget(day, isNextMonth: true));
    }

    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.0,
      children: dayWidgets,
    );
  }

  // Har bir kun uchun widget
  Widget _buildDayWidget(
    int day, {
    bool isPreviousMonth = false,
    bool isNextMonth = false,
  }) {
    DateTime currentDay;

    if (isPreviousMonth) {
      currentDay = DateTime(_currentDate.year, _currentDate.month - 1, day);
    } else if (isNextMonth) {
      currentDay = DateTime(_currentDate.year, _currentDate.month + 1, day);
    } else {
      currentDay = DateTime(_currentDate.year, _currentDate.month, day);
    }

    final isSelected =
        _selectedDate != null &&
        widget.calendarService.isSameDay(currentDay, _selectedDate!);
    final isToday = widget.calendarService.isSameDay(
      currentDay,
      DateTime.now(),
    );
    final hasEvents = widget.calendarService
        .getEventsForDay(currentDay)
        .isNotEmpty;
    final isCurrentMonth = !isPreviousMonth && !isNextMonth;

    return GestureDetector(
      onTap: () {
        if (!isCurrentMonth) {
          // Agar boshqa oyning kuni bosilsa, o'sha oyga o'tish
          setState(() {
            if (isPreviousMonth) {
              _currentDate = DateTime(
                _currentDate.year,
                _currentDate.month - 1,
              );
            } else if (isNextMonth) {
              _currentDate = DateTime(
                _currentDate.year,
                _currentDate.month + 1,
              );
            }
            _selectedDate = currentDay;
          });
        } else {
          setState(() {
            _selectedDate = currentDay;
          });
        }

        widget.onDateSelected?.call(currentDay);
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.purple
              : isToday
              ? Colors.purple.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isToday && !isSelected
              ? Border.all(color: Colors.purple.withOpacity(0.3), width: 1)
              : null,
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isToday || isSelected
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : isCurrentMonth
                      ? Colors.black87
                      : Colors.grey[400],
                ),
              ),
            ),
            // Event indicator
            if (hasEvents && isCurrentMonth)
              Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.purple,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Tanlangan kun uchun eventlar ro'yxati
  Widget _buildEventsList() {
    if (_selectedDate == null) return const SizedBox.shrink();

    final events = widget.calendarService.getEventsForDay(_selectedDate!);

    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Eventlar',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                DateFormat('dd MMMM', 'uz').format(_selectedDate!),
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
          const SizedBox(height: 12),

          if (events.isEmpty)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.event_busy, color: Colors.grey[400], size: 32),
                    const SizedBox(height: 8),
                    Text(
                      'Bu kun uchun hech qanday event yo\'q',
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return _buildEventItem(events[index]);
                },
              ),
            ),
        ],
      ),
    );
  }

  // Event item widget
  Widget _buildEventItem(CalendarEvent event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: event.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: event.color.withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 50,
            decoration: BoxDecoration(
              color: event.color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${DateFormat('HH:mm').format(event.startTime)} - ${DateFormat('HH:mm').format(event.endTime)}',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (event.description != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    event.description!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              widget.calendarService.removeEvent(event);
              setState(() {});
            },
            icon: Icon(Icons.delete_outline, color: Colors.grey[500], size: 20),
          ),
        ],
      ),
    );
  }

  // Oldingi oyga o'tish
  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
    });
  }

  // Keyingi oyga o'tish
  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
    });
  }
}

// Calendar Page - injectable
@injectable
class CalendarPage extends StatelessWidget {
  final CalendarService calendarService;

  const CalendarPage({Key? key, required this.calendarService})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Kalendar',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () => _showAddEventDialog(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomUzbekCalendar(
          calendarService: calendarService,
          onDateSelected: (date) {
            print('Tanlangan kun: ${DateFormat('yyyy-MM-dd').format(date)}');
          },
        ),
      ),
    );
  }

  // Event qo'shish dialog
  void _showAddEventDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    DateTime selectedDate = DateTime.now();
    TimeOfDay startTime = TimeOfDay.now();
    TimeOfDay endTime = TimeOfDay(
      hour: TimeOfDay.now().hour + 1,
      minute: TimeOfDay.now().minute,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Yangi Event Qo\'shish'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Event nomi',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Tavsif (ixtiyoriy)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              // Kun tanlash
              ListTile(
                title: Text(
                  'Kun: ${DateFormat('dd MMMM yyyy').format(selectedDate)}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now().subtract(
                      const Duration(days: 365),
                    ),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    selectedDate = date;
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Bekor qilish'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                final event = CalendarEvent(
                  title: titleController.text,
                  startTime: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    startTime.hour,
                    startTime.minute,
                  ),
                  endTime: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    endTime.hour,
                    endTime.minute,
                  ),
                  description: descriptionController.text.isEmpty
                      ? null
                      : descriptionController.text,
                  color:
                      Colors.primaries[titleController.text.length %
                          Colors.primaries.length],
                );

                calendarService.addEvent(event);
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Event muvaffaqiyatli qo\'shildi!'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            ),
            child: const Text('Qo\'shish'),
          ),
        ],
      ),
    );
  }
}

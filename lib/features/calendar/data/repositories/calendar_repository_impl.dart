// import 'package:injectable/injectable.dart';
// import '../../domain/entities/calendar_day.dart';
// import '../../domain/repositories/calendar_repository.dart';

// @LazySingleton(as: CalendarRepository)
// class CalendarRepositoryImpl implements CalendarRepository {
//   @override
//   List<CalendarDay> getMonthDays(DateTime month) {
//     final firstDayOfMonth = DateTime(month.year, month.month, 1);
//     final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

//     final days = <CalendarDay>[];

//     for (int i = 1; i < firstDayOfMonth.weekday; i++) {
//       days.add(CalendarDay(
//         date: firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - i)),
//         isCurrentMonth: false,
//       ));
//     }

//     for (int i = 0; i < lastDayOfMonth.day; i++) {
//       final date = DateTime(month.year, month.month, i + 1);
//       days.add(CalendarDay(
//         date: date,
//         isToday: date.day == DateTime.now().day &&
//                  date.month == DateTime.now().month &&
//                  date.year == DateTime.now().year,
//       ));
//     }

//     return days;
//   }

//   @override
//   List<CalendarDay> getWeekDays(DateTime selectedDate) {
//     final startOfWeek = selectedDate.subtract(Duration(days: selectedDate.weekday % 7));
//     return List.generate(7, (index) {
//       final date = startOfWeek.add(Duration(days: index));
//       return CalendarDay(
//         date: date,
//         isToday: date.day == DateTime.now().day &&
//                  date.month == DateTime.now().month &&
//                  date.year == DateTime.now().year,
//       );
//     });
//   }
// }

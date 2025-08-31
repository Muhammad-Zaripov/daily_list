// import 'package:injectable/injectable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../domain/entities/calendar_day.dart';
// import '../../domain/repositories/calendar_repository.dart';

// enum CalendarView { month, week }

// class CalendarState {
//   final CalendarView view;
//   final DateTime focusedDate;
//   final List<CalendarDay> days;

//   CalendarState({
//     required this.view,
//     required this.focusedDate,
//     required this.days,
//   });

//   CalendarState copyWith({
//     CalendarView? view,
//     DateTime? focusedDate,
//     List<CalendarDay>? days,
//   }) {
//     return CalendarState(
//       view: view ?? this.view,
//       focusedDate: focusedDate ?? this.focusedDate,
//       days: days ?? this.days,
//     );
//   }
// }

// @injectable
// class CalendarCubit extends Cubit<CalendarState> {
//   final CalendarRepository repository;

//   CalendarCubit(this.repository)
//     : super(
//         CalendarState(
//           view: CalendarView.month,
//           focusedDate: DateTime.now(),
//           days: [],
//         ),
//       ) {
//     loadMonth(DateTime.now());
//   }

//   void loadMonth(DateTime date) {
//     emit(
//       state.copyWith(
//         view: CalendarView.month,
//         focusedDate: date,
//         days: repository.getMonthDays(date),
//       ),
//     );
//   }

//   void loadWeek(DateTime date) {
//     emit(
//       state.copyWith(
//         view: CalendarView.week,
//         focusedDate: date,
//         days: repository.getWeekDays(date),
//       ),
//     );
//   }

//   void toggleView() {
//     if (state.view == CalendarView.month) {
//       loadWeek(state.focusedDate);
//     } else {
//       loadMonth(state.focusedDate);
//     }
//   }
// }

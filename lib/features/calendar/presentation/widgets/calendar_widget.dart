// import 'package:flutter/material.dart';
// import '../../domain/entities/calendar_day.dart';

// class CalendarWidget extends StatelessWidget {
//   final List<CalendarDay> days;
//   final CalendarDay? selectedDay;
//   final Function(CalendarDay) onDaySelected;
//   final bool isMonthView;

//   const CalendarWidget({
//     super.key,
//     required this.days,
//     required this.onDaySelected,
//     this.selectedDay,
//     this.isMonthView = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 7,
//       ),
//       itemCount: days.length,
//       itemBuilder: (context, index) {
//         final day = days[index];
//         final isSelected = selectedDay?.date == day.date;

//         return GestureDetector(
//           onTap: () => onDaySelected(day),
//           child: Container(
//             margin: EdgeInsets.all(4),
//             decoration: BoxDecoration(
//               color: isSelected ? Colors.purple : null,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Center(
//               child: Text(
//                 "${day.date.day}",
//                 style: TextStyle(
//                   color: day.isCurrentMonth
//                       ? (isSelected ? Colors.white : Colors.black)
//                       : Colors.grey,
//                   fontWeight: day.isToday ? FontWeight.bold : FontWeight.normal,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

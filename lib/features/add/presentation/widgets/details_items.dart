import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/shader/widgets/app_primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_text.dart';
import '../../../calendar/domain/services/calendar_service.dart';
import '../../../calendar/presentation/widgets/calendar_header.dart';
import '../../../calendar/presentation/widgets/calendart_grid.dart';
import '../../../calendar/presentation/widgets/week_days_row.dart';
import '../../data/model/detail_model.dart';

class DetailsItems extends StatefulWidget {
  final CalendarService calendarService;
  final OnDateSelected? onDateSelected;
  const DetailsItems({
    super.key,
    required this.calendarService,
    this.onDateSelected,
  });

  @override
  State<DetailsItems> createState() => _DetailsItemsState();
}

class _DetailsItemsState extends State<DetailsItems> {
  late DateTime _currentDate = DateTime.now();

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
  List<bool> switchValues = [false, false, false];
  @override
  Widget build(BuildContext context) {
    List<DetailModel> list = [
      DetailModel(
        icon: AppAssets.calendar,
        index: 0,
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (_) {
              return StatefulBuilder(
                builder: (context, setModalState) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: AppColors.natural100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              SvgPicture.asset(
                                AppAssets.calendar,
                                color: AppColors.primary,
                              ),
                              AppText(
                                text: 'select_date',
                                fontSize: 20,
                                fontWeight: 600,
                              ),
                            ],
                          ),
                          16.g,
                          CalendarHeader(
                            currentDate: _currentDate,
                            months: months,
                            onPrevious: () => setModalState(
                              () => _currentDate = DateTime(
                                _currentDate.year,
                                _currentDate.month - 1,
                              ),
                            ),
                            onNext: () => setModalState(
                              () => _currentDate = DateTime(
                                _currentDate.year,
                                _currentDate.month + 1,
                              ),
                            ),
                          ),
                          16.g,
                          WeekDaysRow(weekDays: weekDays),
                          8.g,
                          CalendarGrid(
                            currentDate: _currentDate,
                            selectedDate: _selectedDate,
                            calendarService: widget.calendarService,
                            onDaySelected: (date) {
                              setModalState(() => _selectedDate = date);
                              widget.onDateSelected?.call(date);
                            },
                          ),
                          20.g,
                          AppPrimaryButton(
                            onTap: () {
                              Navigator.pop(context);
                              print(_selectedDate);
                            },
                            title: 'save',
                          ),
                          20.g,
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },

        title: "date",
      ),
      DetailModel(
        icon: AppAssets.infoTimerOutline,
        index: 1,
        onTap: () {},
        title: "time",
      ),
      // DetailModel(
      //   icon: AppAssets.notificationOutline,
      //   index: 2,
      //   onTap: () {},
      //   title: "reminder",
      // ),
    ];

    return Expanded(
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.natural100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      item.icon,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                      color: AppColors.secondary,
                    ),
                    AppText(text: item.title),
                  ],
                ),
                Transform.scale(
                  scale: 0.9,
                  child: CupertinoSwitch(
                    inactiveTrackColor: AppColors.natural400,
                    activeColor: AppColors.primary400,
                    value: switchValues[index],
                    onChanged: (value) {
                      setState(() {
                        switchValues[index] = value;
                      });

                      if (value) {
                        item.onTap();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) =>
            const Divider(height: 1, thickness: 1, color: AppColors.natural400),
      ),
    );
  }
}

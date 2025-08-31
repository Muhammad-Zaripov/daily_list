import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/constants/app_colors.dart';
import 'package:daily_list/features/main/data/model/main_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/di/di.dart';
import '../../../add/presentation/screens/add_screen.dart';
import '../../../calendar/presentation/screens/calendar_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../note/presentation/screens/note_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;
  late final List<MainModel> navItems;

  @override
  void initState() {
    super.initState();
    navItems = [
      MainModel(
        index: 0,

        title: "home",
        icon: AppAssets.home,
        selectIcon: AppAssets.homeSelect,
      ),
      MainModel(
        index: 1,

        title: "note",
        icon: AppAssets.note,
        selectIcon: AppAssets.noteSelect,
      ),
      MainModel(index: 2),
      MainModel(
        index: 3,
        title: "calendar",
        icon: AppAssets.calendar,
        selectIcon: AppAssets.calendarSelect,
      ),
      MainModel(
        index: 4,
        title: "profile",
        icon: AppAssets.profile,
        selectIcon: AppAssets.profileSelect,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.natural100,
      body: IndexedStack(
        index: currentPage,
        children: [
          HomeScreen(),
          NoteScreen(),
          // AddScreen(),
          SizedBox(),
          CustomUzbekCalendar(calendarService: getIt<CalendarService>()),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.natural400),
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        height: 100,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: currentPage,
                onTap: (index) {
                  if (index == 2) {
                    return;
                  }
                  setState(() {
                    currentPage = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedItemColor: AppColors.primary400,
                unselectedItemColor: AppColors.secondary,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: currentPage == 0
                        ? SvgPicture.asset(navItems[0].selectIcon!)
                        : SvgPicture.asset(navItems[0].icon!),
                    label: navItems[0].title?.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: currentPage == 1
                        ? SvgPicture.asset(navItems[1].selectIcon!)
                        : SvgPicture.asset(navItems[1].icon!),
                    label: navItems[1].title?.tr(),
                  ),
                  const BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: currentPage == 3
                        ? SvgPicture.asset(navItems[3].selectIcon!)
                        : SvgPicture.asset(navItems[3].icon!),
                    label: navItems[3].title?.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: currentPage == 4
                        ? SvgPicture.asset(navItems[4].selectIcon!)
                        : SvgPicture.asset(
                            navItems[4].icon!,
                            color: AppColors.secondary,
                          ),
                    label: navItems[4].title?.tr(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -5,
              child: GestureDetector(
                onTap: () {
                  // setState(() {
                  //   currentPage = 2;
                  // });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddScreen()),
                  );
                },
                child: Container(
                  width: 50,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColors.primary400,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

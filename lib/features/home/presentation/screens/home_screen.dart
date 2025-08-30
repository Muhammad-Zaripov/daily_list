import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/custom_body.dart';
import '../widgets/filter_button.dart';
import '../widgets/home_header.dart';
import '../widgets/home_tab_bar.dart';
import '../widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.natural200,
      body: Column(
        children: [
          HomeHeader(),
          HomeTabBar(tabController: _tabController),
          16.g,
          Expanded(
            child: CustomBody(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterButton(),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        HomeWidget(),
                        HomeWidget(),
                        HomeWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_padding_widget.dart';
import '../../../../shader/widgets/app_text.dart';

class HomeTabBar extends StatefulWidget {
  final TabController tabController;
  const HomeTabBar({super.key, required this.tabController});
  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            dividerColor: AppColors.natural200,
            indicator: BoxDecoration(
              color: AppColors.primary400,
              borderRadius: BorderRadius.circular(16),
            ),
            indicatorPadding: EdgeInsets.only(bottom: 4, top: 40),
            isScrollable: true,
            labelStyle: TextStyle(
              color: AppColors.primary400,
              fontWeight: FontWeight.w600,
            ),

            controller: widget.tabController,
            labelPadding: const EdgeInsets.only(right: 8, left: 8),
            unselectedLabelStyle: TextStyle(
              color: AppColors.secondary,
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: AppColors.primary400,
            tabs: [
              Tab(text: 'yesterday'.tr()),
              Tab(text: 'today'.tr()),
              Tab(text: 'tomorrow'.tr()),
            ],
          ),
          AppText(
            text: 'see_all',
            color: AppColors.primary400,
            fontWeight: 600,
          ),
        ],
      ),
    );
  }
}

import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/app_padding_widget.dart';
import '../../../../shader/widgets/app_text.dart';
import '../../../../shader/widgets/delete_dialog.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showAdaptiveDialog(
          context: context,
          builder: (context) => DeleteDialog(),
        );
      },
      child: AppPaddingWidget(
        top: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: isDone ? 0.5 : 1,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 16,
                    left: -6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.danger400,
                      ),
                      width: 100,
                      height: 30,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      top: 45,
                    ),
                    clipBehavior: Clip.hardEdge,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primary100,
                    ),
                    child: Column(
                      children: [
                        Row(
                          spacing: 24,
                          children: [
                            Expanded(
                              child: Column(
                                spacing: 4,
                                children: [
                                  AppText(
                                    maxLines: 1,
                                    softWrap: true,
                                    text:
                                        'Launching a new product to the market',
                                    fontSize: 20,
                                    fontWeight: 600,
                                  ),
                                  AppText(
                                    maxLines: 1,
                                    softWrap: true,
                                    text:
                                        'Introducing a new product to the market to significantly increase market share',
                                    color: AppColors.secondary,
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isDone = !isDone;
                                });
                              },
                              child: isDone == true
                                  ? SvgPicture.asset(
                                      AppAssets.actionCheckboxFilled,
                                    )
                                  : SvgPicture.asset(AppAssets.checkbox),
                            ),
                          ],
                        ),
                        12.g,
                        Row(
                          spacing: 4,
                          children: [
                            AppText(text: '11:00', isLocalizedKey: false),
                            SvgPicture.asset(AppAssets.notificationOutline),
                          ],
                        ),
                        8.g,
                        Divider(color: AppColors.natural100),
                        8.g,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.primary400,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 4,
                              ),
                              child: AppText(
                                text: 'task',
                                color: AppColors.natural100,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: -6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.danger200,
                      ),
                      width: 100,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:daily_list/core/constants/app_assets.dart';
import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/features/add/data/model/detail_model.dart';
import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:daily_list/shader/widgets/app_primary_button.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/custom_body.dart';
import '../../../../shader/widgets/custom_text_field.dart';
import '../../../../shader/widgets/mine_buttons.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<DetailModel> list = [
    DetailModel(
      icon: AppAssets.calendar,
      index: 0,
      onTap: () {},
      title: "date",
    ),
    DetailModel(
      icon: AppAssets.infoTimerOutline,
      index: 1,
      onTap: () {},
      title: "time",
    ),
    DetailModel(
      icon: AppAssets.notificationOutline,
      index: 2,
      onTap: () {},
      title: "reminder",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final subTitleController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.natural200,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_sharp),
        ),
        centerTitle: true,
        title: AppText(text: 'add_task'),
        backgroundColor: AppColors.natural200,
      ),
      body: CustomBody(
        child: AppPaddingWidget(
          top: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(text: 'category', fontSize: 16, fontWeight: 600),
              8.g,
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: [
                    MineButtons(title: 'task', onTap: () {}),
                    MineButtons(title: 'notifications', onTap: () {}),
                    MineButtons(title: 'event', onTap: () {}),
                    MineButtons(title: 'note', onTap: () {}),
                  ],
                ),
              ),
              16.g,
              CustomTextField(
                hint: 'task_name',
                controller: titleController,
                maxLines: 1,
              ),
              12.g,
              CustomTextField(
                controller: subTitleController,
                hint: "input_description",
                minLines: 2,
              ),
              20.g,
              AppText(text: 'priority', fontSize: 16, fontWeight: 600),
              12.g,
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: [
                    MineButtons(title: 'no_priority', onTap: () {}),
                    MineButtons(title: 'high', onTap: () {}),
                    MineButtons(title: 'medium', onTap: () {}),
                    MineButtons(title: 'low', onTap: () {}),
                  ],
                ),
              ),
              16.g,
              AppText(text: 'detail', fontSize: 16, fontWeight: 600),
              Expanded(
                child: ListView.separated(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(color: AppColors.natural100),
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
                              value: true,
                              onChanged: (_) {},
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.natural400,
                  ),
                ),
              ),
              AppPrimaryButton(onTap: () {}, title: 'save_new_task'),
              40.g,
            ],
          ),
        ),
      ),
    );
  }
}

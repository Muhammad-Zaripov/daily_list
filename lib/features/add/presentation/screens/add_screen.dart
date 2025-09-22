import 'package:daily_list/core/extensions/gap_extension.dart';
import 'package:daily_list/features/calendar/domain/services/calendar_service.dart';
import 'package:daily_list/shader/widgets/app_padding_widget.dart';
import 'package:daily_list/shader/widgets/app_primary_button.dart';
import 'package:daily_list/shader/widgets/app_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shader/widgets/custom_body.dart';
import '../../../../shader/widgets/custom_text_field.dart';
import '../widgets/category_status_items.dart';
import '../widgets/details_items.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int selectedCategory = 0;
  int selectedPriority = 0;

  final List<String> category = ["task", "notifications", "event", "note"];
  final List<String> priority = ["no_priority", "high", "medium", "low"];
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
              CategoryStatusItems(items: category),
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
              CategoryStatusItems(items: priority),
              16.g,
              AppText(text: 'detail', fontSize: 16, fontWeight: 600),
              DetailsItems(calendarService: CalendarService()),
              AppPrimaryButton(onTap: () {}, title: 'save_new_task'),
              40.g,
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_tangerine/constant/app_colors.dart';
import 'package:red_tangerine/utils/app_log.dart';
import 'package:red_tangerine/widgets/Button_widget.dart';
import 'package:red_tangerine/widgets/space_widget.dart';
import 'package:red_tangerine/widgets/text_widget.dart';

class CustomCalendarPicker extends StatefulWidget {
  const CustomCalendarPicker({super.key, required this.onSelect});
  final void Function(String data) onSelect;
  @override
  State<CustomCalendarPicker> createState() => _CustomCalendarPickerState();
}

class _CustomCalendarPickerState extends State<CustomCalendarPicker> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  int selectedDay = DateTime.now().day;

  final FixedExtentScrollController yearController =
      FixedExtentScrollController();
  final FixedExtentScrollController monthController =
      FixedExtentScrollController();
  final FixedExtentScrollController dayController =
      FixedExtentScrollController();

  List<int> years = List.generate(200, (i) => 1900 + i); // 1900–2099
  List<int> months = List.generate(12, (i) => i + 1);

  List<int> get days {
    int daysInMonth = DateTime(selectedYear, selectedMonth + 1, 0).day;
    return List.generate(daysInMonth, (i) => i + 1);
  }

  @override
  void initState() {
    super.initState();

    yearController.jumpToItem(years.indexOf(selectedYear));
    monthController.jumpToItem(selectedMonth - 1);
    dayController.jumpToItem(selectedDay - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.grey_50,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextWidget.header(text: 'Year')),
                Expanded(child: TextWidget.header(text: 'Month')),
                Expanded(child: TextWidget.header(text: 'Day')),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  // Year picker
                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      controller: yearController,
                      itemExtent: 40,
                      perspective: 0.005,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedYear = years[index];
                          // adjust day if overflow
                          if (selectedDay > days.length) {
                            selectedDay = days.length;
                            dayController.jumpToItem(selectedDay - 1);
                          }
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          final year = years[index];
                          final isSelected = year == selectedYear;
                          return Center(
                            child: TextWidget(
                              text: year.toString(),

                              fontSize: isSelected ? 0.28 : 0.25,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontColor: isSelected
                                  ? AppColors.grey_900
                                  : AppColors.grey_500,
                            ),
                          );
                        },
                        childCount: years.length,
                      ),
                    ),
                  ),

                  // Month picker
                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      controller: monthController,
                      itemExtent: 40,
                      perspective: 0.005,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedMonth = months[index];
                          // adjust day if overflow
                          if (selectedDay > days.length) {
                            selectedDay = days.length;
                            dayController.jumpToItem(selectedDay - 1);
                          }
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          final month = months[index];
                          final isSelected = month == selectedMonth;
                          return Center(
                            child: TextWidget(
                              text: month.toString().padLeft(2, '0'),

                              fontSize: isSelected ? 0.28 : 0.25,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontColor: isSelected
                                  ? AppColors.grey_900
                                  : AppColors.grey_500,
                            ),
                          );
                        },
                        childCount: months.length,
                      ),
                    ),
                  ),

                  // Day picker
                  Expanded(
                    child: ListWheelScrollView.useDelegate(
                      controller: dayController,
                      itemExtent: 40,
                      perspective: 0.005,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedDay = days[index];
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          final day = days[index];
                          final isSelected = day == selectedDay;
                          return Center(
                            child: TextWidget(
                              text: day.toString().padLeft(2, '0'),

                              fontSize: isSelected ? 0.28 : 0.25,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontColor: isSelected
                                  ? AppColors.grey_900
                                  : AppColors.grey_500,
                            ),
                          );
                        },
                        childCount: days.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SpaceWidget(height: 10),
            Material(
              child: ButtonWidget(
                height: 5,
                text: 'Confirm',
                ontap: () {
                  widget.onSelect("$selectedDay/$selectedMonth/$selectedYear");
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';
import '../../provider/date/date_provider.dart';
import '../../provider/bottomNavigation/bottom_navigation.dart';

class DaySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final daySelectorProvider = Provider.of<DaySelectorProvider>(context);
    final dateProvider = Provider.of<DateProvider>(context);

    // Get the currently selected date from the provider
    final selectedDate = dateProvider.selectedDate;
    // Calculate the number of days in the current month
    final daysInMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;

    // Generate a list of days and dates for the current month
    final days = List.generate(daysInMonth, (index) {
      final date = DateTime(selectedDate.year, selectedDate.month, index + 1);
      return {
        'day': _getDayOfWeek(date.weekday),
        'date': date.day,
      };
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(days.length, (index) {
          bool isSelected = daySelectorProvider.selectedIndex == index;

          return GestureDetector(
            onTap: () {
              daySelectorProvider.selectDay(index);
              dateProvider.updateDate(
                DateTime(
                    selectedDate.year, selectedDate.month, index + 1),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    AppTextWidget(
                      text: days[index]['day']!.toString(),
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                    SizedBox(height: 8.0),
                    AppTextWidget(
                      text: days[index]['date']!.toString(),
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  String _getDayOfWeek(int weekday) {
    // Adjusted to align with DateTime.weekday (1 = Monday, 7 = Sunday)
    List<String> days = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    return days[weekday - 1];
  }
}
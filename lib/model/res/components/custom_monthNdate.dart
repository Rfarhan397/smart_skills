import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';

import '../../provider/bottomNavigation/bottom_navigation.dart';

class DaySelector extends StatelessWidget {
  final List<String> days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  final List<int> dates = [16, 17, 18, 19, 20, 21, 22];

  @override
  Widget build(BuildContext context) {
    final daySelectorProvider = Provider.of<DaySelectorProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(days.length, (index) {
          bool isSelected = daySelectorProvider.selectedIndex == index;

          return GestureDetector(
            onTap: () {
              daySelectorProvider.selectDay(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 12.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    AppTextWidget(
                      text:
                      days[index],
                        color: isSelected ? Colors.white : Colors.grey,
                    ),
                    SizedBox(height: 8.0),
                    AppTextWidget(
                      text:
                      dates[index].toString(),

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
}

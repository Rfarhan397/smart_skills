import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';

import '../../provider/date/date_provider.dart';

class MonthYearSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedDate = context.watch<DateProvider>().selectedDate;
    final monthYear = '${_getMonth(selectedDate.month)}, ${selectedDate.year}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      GestureDetector(
        onTap: () {
          context.read<DateProvider>().previousMonth();
        },
        child: SizedBox(
                  height: 40.0,
                  child: Icon(Icons.arrow_back_ios,size: 16,)
              ),
      ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 3.w),
          child: AppTextWidget(text:
            monthYear,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<DateProvider>().nextMonth();
          },
          child: SizedBox(
              height: 40.0,
              child: Icon(Icons.arrow_forward_ios,size: 16,)
          ),
        ),
      ],
    );
  }
  String _getMonth(int month) {
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}
// class MonthYearSelector extends StatelessWidget {
//   final String monthYear;
//   final VoidCallback onPrevious;
//   final VoidCallback onNext;
//
//   const MonthYearSelector({
//     Key? key,
//     required this.monthYear,
//     required this.onPrevious,
//     required this.onNext,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.symmetric(horizontal: 26.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//         onTap: onPrevious,
//             child: Container(
//               height: 40.0,
//               child: Icon(Icons.arrow_back_ios,size: 16,)
//             ),
//
//
//           ),
//           AppTextWidget(text:
//             monthYear,
//               fontSize: 16.0,
//               fontWeight: FontWeight.w500,
//           ),
//           GestureDetector(
//             onTap: onNext,
//             child: Container(
//                 height: 40.0,
//                 child: Icon(Icons.arrow_forward_ios,size: 16,)
//             ),
//
//
//           ),
//         ],
//       ),
//     );
//   }
// }

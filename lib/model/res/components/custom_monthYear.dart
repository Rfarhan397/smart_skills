import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';

class MonthYearSelector extends StatelessWidget {
  final String monthYear;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const MonthYearSelector({
    Key? key,
    required this.monthYear,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 26.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
        onTap: onPrevious,
            child: Container(
              height: 40.0,
              child: Icon(Icons.arrow_back_ios,size: 16,)
            ),
          

          ),
          AppTextWidget(text:
            monthYear,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
          ),
          GestureDetector(
            onTap: onNext,
            child: Container(
                height: 40.0,
                child: Icon(Icons.arrow_forward_ios,size: 16,)
            ),


          ),
        ],
      ),
    );
  }
}

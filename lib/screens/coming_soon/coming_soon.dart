import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';

import '../dashboard/profile_header.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProfileHeader(),
              SizedBox(height: 1.h,),
              Container(
                  height: 68.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xffE9E9EE),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextWidget(text: 'Coming Soon',fontSize: 22,)
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20.0),
                      //     color: Colors.white,
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       MonthYearSelector(
                      //         monthYear: 'July, 2014',
                      //         onNext: () {
                      //
                      //         },
                      //         onPrevious: () {
                      //
                      //         },
                      //       ),
                      //       DaySelector()
                      //
                      //     ],
                      //   ),
                      // ),
                   
      
                    ],)),
            ],
          ),
        ),
      ),
    );
  }
}

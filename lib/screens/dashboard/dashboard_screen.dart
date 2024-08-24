import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';
import 'package:smartyyy/screens/dashboard/profile_header.dart';

import '../../model/res/components/CustomProgressChart.dart';
import '../../model/res/components/custom_monthNdate.dart';
import '../../model/res/components/custom_monthYear.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xffE9E9EE),
                ),
                child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        MonthYearSelector(
                          monthYear: 'July, 2014',
                          onNext: () {

                          },
                          onPrevious: () {

                          },
                        ),
                        DaySelector()

                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(2.h),
                    child: Container(
                      height: 46.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: CustomProgressChart(),
                    ),
                  ),

                ],)),
            ],
          ),
        ),
      ),
    );
  }
}


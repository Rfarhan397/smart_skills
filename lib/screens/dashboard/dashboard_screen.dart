import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';
import 'package:smartyyy/screens/dashboard/profile_header.dart';

import '../../model/provider/date/date_provider.dart';
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
                height: 71.h,
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
                        GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: context.read<DateProvider>().selectedDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (picked != null) {
                              context.read<DateProvider>().updateDate(picked);
                            }
                          },
                          child: MonthYearSelector(),
                        ),
                        DaySelector(),
                      ],
                    ),
                  ),

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
                  Padding(
                    padding:  EdgeInsets.all(1.h),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 53.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
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


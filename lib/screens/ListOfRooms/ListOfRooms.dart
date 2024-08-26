import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/provider/listOfRooms/listofrooms_provider.dart';
import '../../model/res/components/device_card.dart';
import '../../model/res/constant/app_icons.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../model/res/widgets/button_widget.dart';
import '../dashboard/profile_header.dart';

class ListOfRooms extends StatelessWidget {
  const ListOfRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ProfileHeader(),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 68.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xffE9E9EE),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 10.h,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const AppTextWidget(
                              text: 'List of Rooms',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                // Search Button
                                Container(
                                  height: 5.h,
                                  width: 11.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(AppIcons.search),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 5.h,
                                  width: 11.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(AppIcons.download),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                ButtonWidget(
                                  onClicked: () {
                                    // Define your list of actions here
                                  },
                                  height: 6.h,
                                  width: 25.w,
                                  radius: 1.h,
                                  text: 'List of Actions',
                                  fontSize: 10,
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),                        ],
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                          child: Column(
                            children: List.generate(4, (index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: GestureDetector(
                                  onTap: () {
                                    context.read<SelectionProvider>().select(index);
                                  },
                                  child: Consumer<SelectionProvider>(
                                    builder: (context, provider, child) {
                                      return DeviceCard(
                                        isSelected: provider.selectedIndex == index,
                                        deviceStatus: "No Available",
                                        availableDevices: "2",
                                        checkOutTime: "22 Jun - 12:00 AM",
                                        roomNumber: "1",
                                        reportProblems: "TV",
                                        requestServices: "Laundry",
                                      );
                                    },
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class InfoText extends StatelessWidget {
  final String title;
  final String value;
  final bool isHighlighted;

  const InfoText({
    Key? key,
    required this.title,
    required this.value,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
          text: title,

          color: Colors.grey,
          fontSize: 9,
          fontWeight: FontWeight.w300,

        ),
        SizedBox(height: 0.2.h),
        AppTextWidget(
          text:
          value,
          color: isHighlighted ? Colors.red : Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
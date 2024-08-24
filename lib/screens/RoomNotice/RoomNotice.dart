import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/provider/listOfRooms/listofrooms_provider.dart';
import '../../model/res/components/CustomProgressChart.dart';
import '../../model/res/components/custom_monthNdate.dart';
import '../../model/res/components/custom_monthYear.dart';
import '../../model/res/components/device_card.dart';
import '../../model/res/constant/app_icons.dart';
import '../../model/res/widgets/app_text.dart.dart';
import '../../model/res/widgets/button_widget.dart';
import '../dashboard/profile_header.dart';

class RoomNotice extends StatelessWidget {
  const RoomNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                              text: 'Rooms Notice',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Row(
                              children: [
                                // Search Button
                                Container(
                                  height: 5.h,
                                  width: 10.w,
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
                                  width: 10.w,
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
                                      return DeviceCardN(
                                        isSelected: provider.selectedIndex == index,
                                        deviceStatus: "10 Jun, 10:00",
                                        availableDevices: "2",
                                        checkOutTime: "Asking Cleaning",
                                        roomNumber: "True",
                                        reportProblems: "Done",
                                        requestServices: "Operator",
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
class DeviceCardN extends StatelessWidget {
  final bool isSelected;
  final String deviceStatus;
  final String availableDevices;
  final String checkOutTime;
  final String roomNumber;
  final String reportProblems;
  final String requestServices;

  const DeviceCardN({
    Key? key,
    required this.isSelected,
    required this.deviceStatus,
    required this.availableDevices,
    required this.checkOutTime,
    required this.roomNumber,
    required this.reportProblems,
    required this.requestServices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red[100] : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: isSelected ? Border.all(color: Colors.red, width: 1) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InfoTextN(title: "Date & Time", value: deviceStatus, isHighlighted: isSelected),
              const Spacer(),
              InfoTextN(title: "Room Number", value: availableDevices),
              const Spacer(),
              InfoTextN(title: "Problem Name", value: checkOutTime, isHighlighted: isSelected),

            ],
          ),
          SizedBox(height: 1.5.h),
          Row(
            children: [
              InfoTextN(title: "Room Number", value: roomNumber),
              const Spacer(),
              InfoTextN(
                title: "Report Problems",
                value: reportProblems,
                isHighlighted: reportProblems == "Done", // Highlight only if the value is "Done"
              ),
              const Spacer(),
              InfoTextN(title: "Request for services", value: requestServices, isHighlighted: isSelected),
            ],
          ),
        ],
      ),
    );
  }
}
class InfoTextN extends StatelessWidget {
  final String title;
  final String value;
  final bool isHighlighted;

  const InfoTextN({
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
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w300,

        ),
        SizedBox(height: 0.2.h),
        AppTextWidget(
          text:
          value,
          color: value == "Done" ? Colors.green : isHighlighted ? Colors.red : Colors.black,
          fontSize: 12,
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
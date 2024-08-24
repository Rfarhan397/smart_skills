import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../screens/ListOfRooms/ListOfRooms.dart';

class DeviceCard extends StatelessWidget {
  final bool isSelected;
  final String deviceStatus;
  final String availableDevices;
  final String checkOutTime;
  final String roomNumber;
  final String reportProblems;
  final String requestServices;

  const DeviceCard({
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
              InfoText(title: "Device Status", value: deviceStatus, isHighlighted: isSelected),
              const Spacer(),
              InfoText(title: "Available Devices", value: availableDevices),
              const Spacer(),
              InfoText(title: "Check-out time", value: checkOutTime, isHighlighted: isSelected),
            ],
          ),
          SizedBox(height: 1.5.h),
          Row(
            children: [
              InfoText(title: "Room Number", value: roomNumber),
              const Spacer(),
              InfoText(title: "Report Problems", value: reportProblems),
              const Spacer(),
              InfoText(title: "Request for services", value: requestServices, isHighlighted: isSelected),
            ],
          ),
        ],
      ),
    );
  }
}

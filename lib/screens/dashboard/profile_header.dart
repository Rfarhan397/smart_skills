import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/constant/app_colors.dart';
import 'package:smartyyy/model/res/constant/app_icons.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
AppColors.appBlackColor,
          Color(0xff1F1F23),
        ]),
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 28.0,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              SizedBox(width: 12.0),
              // Username and Role
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextWidget(
                    text: 'jasontodd1997@',
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  AppTextWidget(
                    text: 'Admin',
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ],
              ),
            ],
          ),
          // Action Buttons
          Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Image.asset(
                      AppIcons.language,
                    ),
                  )),
              SizedBox(width: 16.0), // Space between icons
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Image.asset(
                      AppIcons.notification,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

void main() =>
    runApp(MaterialApp(home: Scaffold(body: Center(child: ProfileHeader()))));

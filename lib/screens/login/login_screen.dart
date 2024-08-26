import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/constant/app_assets.dart';
import 'package:smartyyy/model/res/routes/routes_name.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';
import 'package:smartyyy/model/res/widgets/app_text_field.dart';

import '../../model/res/constant/app_colors.dart';
import '../../model/res/constant/app_icons.dart';
import '../../model/res/widgets/button_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true, // Ensure content resizes when keyboard opens
      body: Stack(
        children: [
          Transform.translate(
              offset: Offset(100.w, -9.w),
              child: BackgroundImageContainer()),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom), // Prevent content from being blocked by the keyboard
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 7.h),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.h,
                    left: 5.w,
                    right: 5.w,
                    bottom: 2.h,
                  ),
                  child: Center(
                    child: Image.asset(
                      AppIcons.logo,
                      fit: BoxFit.cover,
                      height: 90,
                    ),
                  ),
                ),
                SizedBox(height: 7.h),
                Positioned(
                 bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.h),
                          topRight: Radius.circular(3.h),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: AppTextWidget(
                                text: 'Welcome back, Jacson!',
                                color: Colors.black,
                                fontSize: 22,
                              )),
                          Center(
                              child: AppTextWidget(
                                text: 'Please enter your details',
                                color: Colors.grey,
                                fontSize: 12,
                              )),
                          SizedBox(height: 2.h),
                          AppTextWidget(
                            text: 'Username',
                            color: Colors.black,
                            textAlign: TextAlign.start,
                            fontSize: 12,
                          ),
                          SizedBox(height: 0.5.h),
                          AppTextField(
                            radius: 8,
                            hintText: 'jasontodd1979@',
                          ),
                          SizedBox(height: 2.h),
                          AppTextWidget(
                            text: 'Password',
                            color: Colors.black,
                            textAlign: TextAlign.start,
                            fontSize: 12,
                          ),
                          SizedBox(height: 0.5.h),
                          AppTextField(
                            radius: 8,
                            hintText: '*******',
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextWidget(text: 'Remember me'),
                              PrimaryTextButton(
                                title: 'Forgot password',
                                fontSize: 12,
                                onPressed: () {},
                                textColor: AppColors.purplrColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Center(
                            child: ButtonWidget(
                              radius: 8,
                              text: 'Login',
                              onClicked: () {
                                Get.toNamed(RoutesName.mainScreen);
                              },
                              width: 80.w,
                              height: 5.h,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Center(
                              child: AppTextWidget(
                                text: 'Copyright©2024 . All rights reserved.',
                                color: Colors.grey,
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImageContainer extends StatelessWidget {
  const BackgroundImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(pi), // Flip the image horizontally
      child: Container(
        height: 80.h,
        width: 100.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppAssets.boy,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton(
      {super.key,
        required this.onPressed,
        required this.title,
        required this.fontSize,
        required this.textColor});
  final Function() onPressed;
  final String title;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Inter',
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}

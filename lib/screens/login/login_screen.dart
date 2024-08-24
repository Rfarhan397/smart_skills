import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:smartyyy/model/res/constant/app_assets.dart';
import 'package:smartyyy/model/res/widgets/app_text.dart.dart';
import 'package:smartyyy/model/res/widgets/app_text_field.dart';

import '../../model/res/constant/app_colors.dart';
import '../../model/res/constant/app_icons.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
            children: [
              Transform.translate(

                  offset: Offset(100.w, -9.w),
                  child: BackgroundImageContainer()),
          Column(
            children: [
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.only(
                  top: 10.h,
                  left: 5.h,
                  right: 5.h,
                  bottom: 2.h,
                ),
                child: Center(child: Image.asset(AppIcons.logo,fit: BoxFit.cover,height: 90,)),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3.w),
                child: Container(
                  height: 80.h,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.h)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: AppTextWidget(text: 'Welcome back, Jacson!',color: Colors.black,fontSize: 22,)),
                      Center(child: AppTextWidget(text: 'Please enter your details',color:Colors.grey,fontSize: 12,)),
                      SizedBox(height: 2.h,),
                      AppTextWidget(text: 'Username',color:Colors.black,textAlign: TextAlign.start,fontSize: 12,),
                      SizedBox(height: 0.5.h,),
                      AppTextField(
                        radius: 8,
                        hintText: 'jasontodd1979@',),
                      AppTextWidget(text: 'Password',color:Colors.black,textAlign: TextAlign.start,fontSize: 12,),
                      SizedBox(height: 0.5.h,),
                      AppTextField(
                        radius: 8,
                        hintText: '*******',),
                      SizedBox(
                        height: 2.h,
                      ),
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
                      SizedBox(
                        height: 2.h,
                      ),
                      PrimaryButton(
                        onTap: () {},
                        borderRadius: 8,
                        fontSize: 14,
                        height: 48,
                        width: 326,
                        text: 'Login',
                        textColor: Colors.white,
                        bgColor: AppColors.loginButtonColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(child: AppTextWidget(text: 'Copyright©2024 . All rights reserved.',color: Colors.grey,textAlign: TextAlign.center,))
                    ],
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTab,
    required this.subtitleTextStyle,
  });
  final String title, subtitle;
  final TextStyle subtitleTextStyle;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: RichText(
        text: TextSpan(
          text: title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Inter'),
          children: <TextSpan>[
            TextSpan(
              text: subtitle,
              style: subtitleTextStyle,
            ),
          ],
        ),
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

class PrimaryButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  final IconData? iconData;
  final Color? textColor, bgColor;
  const PrimaryButton(
      {Key? key,
        required this.onTap,
        required this.text,
        this.width,
        this.height,
        this.borderRadius,
        this.fontSize,
        required this.textColor,
        required this.bgColor,
        this.iconData})
      : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward().then((_) {
          _controller.reverse();
        });
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _tween.animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
          ),
          child: Container(
            height: widget.height ?? 55,
            alignment: Alignment.center,
            width: widget.width ?? double.maxFinite,
            decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(widget.borderRadius!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.iconData != null) ...[
                  Icon(
                    widget.iconData,
                    color: Colors.transparent,
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: widget.fontSize ?? 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
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
      transform: Matrix4.rotationY(pi),  // Flip the image horizontally
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




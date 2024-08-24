import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import 'app_text.dart.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final double width, height;
  final FontWeight fontWeight;
  final double radius;
  final bool loader, oneColor;
  final Color textColor, borderColor, backgroundColor;
  final bool isShadow;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.width,
    required this.height,
    this.radius = 50.0,
    this.loader = false,
    this.oneColor = false,
    this.textColor = Colors.white,
    this.borderColor = AppColors.purplrColor,
    this.backgroundColor = AppColors.purplrColor,
    this.isShadow = true, required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border:  Border.all(color: Colors.transparent,width: 0.0) ,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              oneColor ? backgroundColor : (AppColors.loginButtonColor),
              oneColor ? backgroundColor : (AppColors.loginButtonColor),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: isShadow ? 2 : 0,
              blurRadius: isShadow ? 5 : 0,
              offset: Offset(isShadow ? 0 : 0, isShadow ? 3 : 0),
            ),
          ],
        ),
        child: loader
            ? const CircularProgressIndicator(
          color: AppColors.appPrimaryColor,
        )
            : Center(
          child: AppTextWidget(
            text: text,
            fontSize: 12.0,
            color: textColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

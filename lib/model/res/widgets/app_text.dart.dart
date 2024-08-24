
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/app_colors.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool softWrap;
  final Color color;
  final TextDecoration textDecoration;
  const AppTextWidget({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.color = AppColors.appBlackColor,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.fontSize = 12,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      maxFontSize: fontSize,
      minFontSize: 8.0,
      //AppLocalizations.of(context)?.translate(text) ?? text,
      text,
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: GoogleFonts.outfit(
        decoration: textDecoration,
          decorationColor: AppColors.appWhiteColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
      ),
    );
  }
}


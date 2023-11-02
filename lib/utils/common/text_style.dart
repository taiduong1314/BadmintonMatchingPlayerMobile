import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class TextAppStyle {
  static TextStyle medium() {
    return GoogleFonts.inter(
        color: AppColor.colorDark, fontSize: 15, fontWeight: FontWeight.w500);
  }

  static TextStyle mediumBoldTextStyle() {
    return GoogleFonts.inter(
        color: AppColor.colorDark, fontSize: 16, fontWeight: FontWeight.w700);
  }

  static TextStyle largeBoldTextStyle() {
    return GoogleFonts.inter(
        color: AppColor.colorDark, fontSize: 18, fontWeight: FontWeight.w700);
  }

  static TextStyle size35() {
    return GoogleFonts.inter(
        color: AppColor.colorDark, fontSize: 35, fontWeight: FontWeight.w600);
  }

  static TextStyle size14W600() {
    return GoogleFonts.inter(
        color: AppColor.colorDark, fontSize: 14, fontWeight: FontWeight.w600);
  }

  static TextStyle h3() {
    return GoogleFonts.inter(
        color: AppColor.colorDark, fontSize: 24, fontWeight: FontWeight.w600);
  }

  static TextStyle h6() {
    return GoogleFonts.inter(
        color: AppColor.colorDark, fontSize: 16, fontWeight: FontWeight.w600);
  }

  static TextStyle bodySmall() {
    return GoogleFonts.inter(
        color: AppColor.colorTextGrey100,
        fontSize: 14,
        fontWeight: FontWeight.w400);
  }

  static TextStyle bodySmallBold() {
    return GoogleFonts.inter(
        color: AppColor.colorDark,
        fontSize: 12,
        fontWeight: FontWeight.w600);
  }

  /// Custom text style.
  static TextStyle customTextStyle(
      {double? fontSize,
      double? lineHeight,
      TextDecoration? textDecoration,
      FontWeight? fontWeight,
      Color? color}) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      height: lineHeight,
      color: color ?? AppColor.colorDark,
      fontWeight: fontWeight,
      decoration: textDecoration,
    );
  }
}

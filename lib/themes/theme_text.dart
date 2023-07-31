import 'package:flutter/material.dart';

import '../utils/color_constants.dart';
import 'app_theme.dart';

abstract class ThemeText {
  static TextStyle heading_22 = const TextStyle(
      fontFamily: appMainLatoFont,
      color: ThemeColor.textWhiteColor,
      fontSize: 22,
      fontWeight: FontWeight.w700);

  static TextStyle secondary_12 = const TextStyle(
      fontFamily: appMainLatoFont,
      color: ThemeColor.textSecondaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w400);

  static TextStyle secondary_16 = const TextStyle(
      fontFamily: appMainLatoFont,
      color: ThemeColor.textWhiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static TextStyle text_12({Color textColor = ThemeColor.textWhiteColor}) {
    return TextStyle(
        fontFamily: appMainLatoFont,
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w400);
  }

  static TextStyle text(
      {FontWeight fontWeight = FontWeight.w500,
      TextOverflow overflow = TextOverflow.ellipsis,
      required textColor,
      required double textSize}) {
    return TextStyle(
      fontFamily: appMainLatoFont,
      color: textColor,
      fontSize: textSize,
      fontWeight: fontWeight,
      overflow: overflow,
    );
  }
}

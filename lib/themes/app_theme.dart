import 'package:flutter/material.dart';

import '../utils/color_constants.dart';

final ThemeData lightTheme = ThemeData.light();

const appMainLatoFont = "Lato";
const robotoFont = "Roboto";
const figtreeFont = "Figtree";

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ThemeColor.primaryColor,
    brightness: Brightness.light,
    fontFamily: appMainLatoFont,
    scaffoldBackgroundColor: ThemeColor.secondaryColor,
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: Colors.white,
      size: 24,
    ),
    primarySwatch: MaterialColor(
        ThemeColor.gettextFieldBackgroundColor(), ThemeColor.themeColors),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide:
            BorderSide(width: 1, color: ThemeColor.textFieldBackgroundColor),
      ),
    ),
    hintColor: ThemeColor.textHintColor_1,
    indicatorColor: ThemeColor.primaryColor,
    disabledColor: ThemeColor.textRippleGrey,
    focusColor: ThemeColor.textWhiteColor,
    shadowColor: ThemeColor.textFieldInputColor_1,
  );
}

ThemeData appThemeDark() {
  return ThemeData(
    primaryColor: Colors.white,
    fontFamily: appMainLatoFont,
    scaffoldBackgroundColor: ThemeColor.secondaryColor,
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: Colors.white,
      size: 24,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide:
            BorderSide(width: 1, color: ThemeColor.textFieldBackgroundColor),
      ),
    ),
    primarySwatch: MaterialColor(
        ThemeColor.gettextFieldBackgroundColor(), ThemeColor.themeColors),
    hintColor: ThemeColor.textHintColor_1,
    indicatorColor: ThemeColor.primaryColor,
    disabledColor: ThemeColor.textRippleGrey,
    focusColor: ThemeColor.textWhiteColor,
    shadowColor: ThemeColor.textFieldInputColor_1,
  );
}

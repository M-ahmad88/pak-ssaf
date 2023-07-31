import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../themes/text_styles.dart';
import '../utils/color_constants.dart';

abstract class ButtonWidgets {
  static Widget outlinedButton(
      {double radius = 12,
      required String text,
      required EdgeInsets edgeInsets,
      required VoidCallback voidCallback,  bool enabled = false,  Color color = ThemeColor.primaryColor, }) {
    return Padding(
        padding: edgeInsets,
        child: OutlinedButton(
          onPressed: voidCallback,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(45),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
          ),
          child: Text(
            text,
            style: const TextStyle(color: ThemeColor.textWhiteColor,fontWeight: FontWeight.w800),
          ),
        ));
  }

  static Widget outlinedBorderButton(
      {double radius = 26,
      required String text,
      required EdgeInsets edgeInsets,
      required VoidCallback voidCallback}) {
    return Padding(
        padding: edgeInsets,
        child: OutlinedButton(
            onPressed: voidCallback,
            style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 2, color: ThemeColor.textSecondaryColor),
                minimumSize: const Size.fromHeight(45),
                backgroundColor: ThemeColor.secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius)),
                foregroundColor: ThemeColor.textRippleGrey),
            child: Text(
              text,
              style: const TextStyle(color: ThemeColor.textWhiteColor,fontWeight: FontWeight.w800),
            )));
  }

  static Widget textButton(
      {EdgeInsets edgeInsets = EdgeInsets.zero,
      Color rippleColor = ThemeColor.textRippleGrey,
      Color textColor = ThemeColor.textSecondaryColor,
      FontWeight fontWeight = FontWeight.w500,
      double textSize = 12,
      required String text,
      required VoidCallback voidCallback}) {
    return TextButton(
      onPressed: voidCallback,
      style: ElevatedButton.styleFrom(foregroundColor: rippleColor),
      child: TextViews.textContainer(
          text: text,
          fontWeight: fontWeight,
          textColor: textColor,
          textSize: textSize,
          edgeInsets: EdgeInsets.zero),
    );
  }

  static Widget svgIconButtons(
      {Color splashColor = Colors.transparent,
      Color highlightColor = Colors.transparent,
      double splashRadius = 18,
      double height = 28,
      double width = 28,
      required VoidCallback onPressed,
      required String svgAsset}) {
    return IconButton(
        splashRadius: splashRadius,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        splashColor: splashColor,
        highlightColor: highlightColor,
        onPressed: onPressed,
        icon: SvgPicture.asset(
          svgAsset,
          height: height,
          width: width,
          fit: BoxFit.scaleDown,
        ));
  }

  static Widget svgSplashIconButtons(
      {double splashRadius = 18,
      double height = 28,
      double width = 28,
      required VoidCallback onPressed,
      required String svgAsset}) {
    return IconButton(
        splashRadius: splashRadius,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        onPressed: onPressed,
        icon: SvgPicture.asset(svgAsset, height: height, width: width));
  }

  static Widget roundButton(
      {double radius = 12,
      Color bgColor = ThemeColor.primaryColor,
      Color textColor = ThemeColor.textWhiteColor,
      required String text,
      required EdgeInsets edgeInsets,
      required VoidCallback voidCallback}) {
    return Padding(
        padding: edgeInsets,
        child: OutlinedButton(
          onPressed: voidCallback,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(45),
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)),
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ));
  }

  static Widget backRoundedButton(BuildContext context,
      {Function()? onBackPressed}) {
    return IconButton(
        splashRadius: 22,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: ThemeColor.textWhiteColor,
          size: 20,
        ));
  }
}

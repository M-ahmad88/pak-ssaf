
import 'package:flutter/material.dart';
import 'package:pak_saaf/themes/theme_text.dart';

import '../utils/color_constants.dart';
import '../utils/size_utils.dart';
import 'app_theme.dart';

abstract class TextViews {
  static Widget textHeading_22(
      {required String text, required EdgeInsets edgeInsets}) {
    return Padding(
        padding: edgeInsets, child: Text(text, style: ThemeText.heading_22));
  }

  static TextStyle txtLatoSemiBold14 = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtLatoRegular18Secondary = TextStyle(
      color: ThemeColor.textSecondaryColor,
      fontSize: getFontSize(18),
      fontFamily: appMainLatoFont,
      fontWeight: FontWeight.w400);

  static TextStyle txtLatoSemiBold14White = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtLatoBold10 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoBold30 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      30,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoBold18 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoBold18Primary = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoBold14primaryColor = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoRegular34PrimaryColor = TextStyle(
      color: ThemeColor.primaryColor,
      fontSize: getFontSize(34),
      fontFamily: appMainLatoFont,
      fontWeight: FontWeight.w400);

  static TextStyle txtLatoBold14OSecondary = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );
  static TextStyle txtLatoBold16Secondary = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoRegular14textSecondaryColor1 = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtLatoRegular12textSecondaryColor1 = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtLatoSemiBold16 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtLatoRegular14Secondary = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular14Blue = TextStyle(
    color: ThemeColor.textBlueColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoBold20 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoRegular20Yellow = TextStyle(
    color: ThemeColor.textYellowHighlight,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoRegular10 = TextStyle(
    color: ThemeColor.textFieldInputColor_1,
    fontSize: getFontSize(
      10,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoSemiBold18 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtLatoRegular10HintColor = TextStyle(
      color: ThemeColor.textHintColor_1,
      fontSize: getFontSize(10),
      fontFamily: appMainLatoFont,
      fontWeight: FontWeight.w400);

  static TextStyle txtLatoRegular10PrimaryColor = TextStyle(
      color: ThemeColor.primaryColor,
      fontSize: getFontSize(10),
      fontFamily: appMainLatoFont,
      fontWeight: FontWeight.w400);

  static TextStyle txtLatoSemiBold18Secondary = TextStyle(
      color: ThemeColor.textSecondaryColor,
      fontSize: getFontSize(18),
      fontFamily: appMainLatoFont,
      fontWeight: FontWeight.w700);

  static Widget textSecondary_12(
      {required String text, required EdgeInsets edgeInsets}) {
    return Padding(
        padding: edgeInsets, child: Text(text, style: ThemeText.secondary_12));
  }

  static Widget textSecondary_16(
      {required String text, required EdgeInsets edgeInsets}) {
    return Padding(
        padding: edgeInsets, child: Text(text, style: ThemeText.secondary_16));
  }

  static Widget text_14(
      {Color textColor = ThemeColor.textWhiteColor,
      EdgeInsets edgeInsets = EdgeInsets.zero,
      required String text}) {
    return Padding(
        padding: edgeInsets,
        child: Text(text,
            style: ThemeText.text(textColor: textColor, textSize: 14)));
  }

  static Widget text_12(
      {Color textColor = ThemeColor.textSecondaryColor,
      EdgeInsets edgeInsets = EdgeInsets.zero,
      required String text}) {
    return Padding(
        padding: edgeInsets,
        child: Text(text,
            style: ThemeText.text(textColor: textColor, textSize: 12)));
  }

  static Widget textContainer({
    Color textColor = ThemeColor.textSecondaryColor,
    EdgeInsets edgeInsets = EdgeInsets.zero,
    FontWeight fontWeight = FontWeight.w500,
    TextOverflow overflow = TextOverflow.clip,
    TextAlign textAlign = TextAlign.start,
    required String text,
    required double textSize,
  }) {
    return Padding(
        padding: edgeInsets,
        child: Text(text,
            style: ThemeText.text(
                overflow: overflow,
                textColor: textColor,
                textSize: textSize,
                fontWeight: fontWeight),
            textAlign: textAlign));
  }

  static TextStyle txtLatoBold16 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoBold16InputHintColor = TextStyle(
    color: ThemeColor.textFieldInputColor_1,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoSemiBold18InputHintColor = TextStyle(
    color: ThemeColor.textFieldInputColor_1,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtLatoSemiBold24 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w600,
  );

  static TextStyle txtLatoSemiBold22 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      22,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtLatoBold14 = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );
  static TextStyle txtLatoRegular14textSecondaryColor01 = TextStyle(
    color: ThemeColor.textSecondaryColor01,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular18 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      18,
    ),
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtLatoRegular18Primary = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      18,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular16Bluegray900 = TextStyle(
    color: ThemeColor.blueGray900,
    fontSize: getFontSize(
      16,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoMedium16Blue400 = TextStyle(
    color: ThemeColor.textBlueColor,
    fontSize: getFontSize(
      16,
    ),
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtLatoRegular14Gray40001 = TextStyle(
    color: ThemeColor.textFieldInputColor_1,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtLatoRegular12TextFieldInput = TextStyle(
    color: ThemeColor.textFieldInputColor_1,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular16 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular16Secondary = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular16Grey = TextStyle(
    color: ThemeColor.textHintColor_1,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtFigtreeRegular16 = TextStyle(
    color: ThemeColor.textBlueColor,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: figtreeFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular14 = TextStyle(
    color: ThemeColor.textHintColor_1,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular14Primary = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular14YellowVariant3 = TextStyle(
    color: ThemeColor.yellowVariant3,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular14SkyBlueVariant2 = TextStyle(
    color: ThemeColor.skyBlueVariant2,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoBold16Primary = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoRegular14White = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular14Grey = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoBold14Grey = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoRegular16White = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular14Yellow = TextStyle(
    color: ThemeColor.yellowVariant,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoMedium14 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtRobotoRegular16 = TextStyle(
    color: ThemeColor.bluegray400,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: robotoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoMedium16 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtLatoRegular12 = TextStyle(
    color: ThemeColor.textSecondaryColor,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular12TextHintColor = TextStyle(
    color: ThemeColor.textHintColor_1,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoSemiBold12TextHintColor = TextStyle(
    color: ThemeColor.textHintColor_1,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w600,
  );
  static TextStyle txtLatoRegular12Primary = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular12White = TextStyle(
    height: 1.5,
    color: ThemeColor.textWhiteColor,
    fontSize: 12,
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoMedium22 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      22,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtLatoMedium22Primary = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      22,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w500,
  );

  static TextStyle txtLatoBold22 = TextStyle(
    color: ThemeColor.textWhiteColor,
    fontSize: getFontSize(
      22,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );
  static TextStyle txtLatoBold12Primary = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );
  static TextStyle txtLato12Primary = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtRobotoRegular20 = TextStyle(
    color: ThemeColor.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle txtLatoRegular14InputHintColor = TextStyle(
    color: ThemeColor.textFieldInputColor_1,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );
  static TextStyle txtLatoBold14InputHintColor = TextStyle(
    color: ThemeColor.textFieldInputColor_1,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w700,
  );

  static TextStyle txtLatoRegular16TextHintColor = TextStyle(
    color: ThemeColor.textFieldInputColor_1,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: appMainLatoFont,
    fontWeight: FontWeight.w400,
  );
}

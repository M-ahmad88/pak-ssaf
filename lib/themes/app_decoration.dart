import 'package:flutter/material.dart';
import '../utils/color_constants.dart';
import '../utils/size_utils.dart';

class AppDecoration {
  static BoxDecoration get greyyy => const BoxDecoration(
        color: ThemeColor.textSecondaryColor,
      );
  static BoxDecoration get fillGray900 => const BoxDecoration(
        color: ThemeColor.secondaryColor,
      );
  static BoxDecoration get fillBluegray900 => const BoxDecoration(
        color: ThemeColor.textFieldBackgroundColor,
      );

  static TextStyle txtLatoBold14primaryColor = TextStyle(
    color: ThemeColor.primaryColor,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Lato',
    fontWeight: FontWeight.w700,
  );

  static BoxDecoration get txtOutlineprimaryColor => BoxDecoration(
    color: ThemeColor.secondaryColor,
    border: Border.all(
      color: ThemeColor.primaryColor,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get outlinetextSecondaryColor => BoxDecoration(
    color: ThemeColor.secondaryColor,
    border: Border.all(
      color: ThemeColor.textSecondaryColor,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
    static BoxDecoration get outlineInActiveColor => BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    border: Border.all(
      color: ThemeColor.inActiveRadio,
      width: getHorizontalSize(
        1,
      ),
    ),
  );


    static BoxDecoration get outlineContinueListening => BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: ThemeColor.inActiveRadio,
      width: getHorizontalSize(
        1,
      ),
    ),
  );


    static BoxDecoration get outlineFillPrimary => BoxDecoration(
      borderRadius: BorderRadius.circular(6),
    color: ThemeColor.primaryColor.withAlpha(20),
    border: Border.all(
      color: ThemeColor.accentColor,
      width: getHorizontalSize(
        1,
      ),
    ),
  );

  static BoxDecoration get txtOutlineGray400 => BoxDecoration(
    color: ThemeColor.secondaryColor,
    border: Border.all(
      color: ThemeColor.textHintColor_1,
      width: getHorizontalSize(
        1,
      ),
    ),
  );

  static BoxDecoration get txtLink => BoxDecoration();
  static BoxDecoration get fillBluegray90001 => const BoxDecoration(
        color: ThemeColor.blueGray90001,
      );
  static BoxDecoration get fillGray90002 => BoxDecoration(
        color: ThemeColor.bottomSheetColor,
      );
  static BoxDecoration get fillGray90001 => const BoxDecoration(
        color: ThemeColor.bottomSheetColor,
      );
  static BoxDecoration get fillWhiteA700 => const BoxDecoration(
        color: ThemeColor.textWhiteColor,
      );
  static BoxDecoration get fillGray90003 => const BoxDecoration(
        color: ThemeColor.gray90003,
      );
  static BoxDecoration get fillGreen600 => BoxDecoration(
    color: ThemeColor.green600,
  );

  static BoxDecoration get outlineprimaryColor => BoxDecoration(
    color: ThemeColor.secondaryColor,
    border: Border.all(
      color: ThemeColor.primaryColor,
      width: getHorizontalSize(
        1,
      ),
    ),
  );
  static BoxDecoration get outlineRadius5primaryColor => BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: ThemeColor.secondaryColor,
    border: Border.all(
      color: ThemeColor.primaryColor,
      width: getHorizontalSize(
        1,
      ),
    ),
  );


  static BoxDecoration get outlineTextSecondary => BoxDecoration(
    color: ThemeColor.secondaryColor,
    border: Border.all(
      color: ThemeColor.textSecondaryColor,
      width: getHorizontalSize(
        1,
      ),
    ),
  );

  static BoxDecoration get fillIndigo800 => BoxDecoration(
    color: ThemeColor.indigo800,
  );
  static BoxDecoration get fillMasterCard => BoxDecoration(
    color: ThemeColor.darkGreen,
  );

}

class BorderRadiusStyle {
  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10,
    ),

  );
  static BorderRadius roundedBorder2 = BorderRadius.circular(
    getHorizontalSize(
      2,
    ),
  );

  static BorderRadius txtCircleBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20,
    ),
  );
  static BorderRadius roundedBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8,
    ),
  );
  static BorderRadius customBorderTL10 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        10,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        10,
      ),
    ),
  );
}

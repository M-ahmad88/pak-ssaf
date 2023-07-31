
import 'package:flutter/material.dart';
import 'package:pak_saaf/utils/size_utils.dart';
import '../common/custom_button.dart';
import '../string_en.dart';
import '../themes/text_styles.dart';
import 'color_constants.dart';

abstract class ViewConstants {
  static double maxSortByBottomSheetSize = 0.18;
  static double maxBottomSheetSize = 0.95;
  static double initBottomSheetSize = 0.90;
  static double minBottomSheetSize = 0.32;
  static double inputTextFieldSize = 58;
  static double appBarSize = 80;
  static double searchBarSize = 54;
  static double categoryContainerSize = 25;
  static int splashScreenDuration = 3; //seconds
  static String lato_font = 'Lato';

  static BoxDecoration getRoundedContainerDecoration({
    required Color solidColor,
    double topLeft = 0.0,
    double bottomLeft = 0.0,
    double bottomRight = 0.0,
    double topRight = 0.0,
  }) {
    return BoxDecoration(
        color: solidColor,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(bottomRight),
            bottomLeft: Radius.circular(bottomLeft)));
  }

  static EdgeInsets scaledEdgeInsets({
    double top = 40,
    double bottom = 50,
    double right = 0,
    double left = 0,
    required BuildContext context,
  }) {
    return EdgeInsets.fromLTRB(
        widthScaled(context: context, pixels: left),
        heightScaled(context: context, pixels: top),
        widthScaled(context: context, pixels: right),
        heightScaled(context: context, pixels: bottom));
  }

  static EdgeInsets scaledPagePadding({
    double top = 14,
    double bottom = 0,
    double right = 16,
    double left = 16,
    required BuildContext context,
  }) {
    return EdgeInsets.fromLTRB(
        widthScaled(context: context, pixels: left),
        heightScaled(context: context, pixels: top),
        widthScaled(context: context, pixels: right),
        heightScaled(context: context, pixels: bottom));
  }

  static Widget rowDivider() {
    return const Divider(
      height: 2,
      color: ThemeColor.textFieldBackgroundColor,
    );
  }

  static Widget circularBar() {
    return const Center(
      child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
    );
  }

  static Widget whiteCircleProgressIndicator(double size) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  static void circularDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      builder: (ctx) {
        return Center(
          child: ViewConstants.whiteCircleProgressIndicator(32),
        );
      },
      context: context,
    );
  }

  static void closeKeyboard(BuildContext context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static Widget viewDivider(){
    return Container(
      height: getVerticalSize(3),
      width: getHorizontalSize(120),
      decoration: BoxDecoration(
          color: ThemeColor.bottomSheetTopDivider,
          borderRadius: BorderRadius.circular(6)),
    );
  }
  static String stringEllipsize(String? txt, int offset) {
    if (txt == null) {
      return "";
    }
    return txt.length > offset ? "${txt.substring(0, offset)}..." : txt;
  }

  static Widget bottomSheetButtonWidget({String? headingStart,  String? headingEnd , String? txtButton, required ButtonVariant variant, required VoidCallback onButtonPressed })
      {
    return Container(
      height:getVerticalSize(headingStart!=null?130:90),
      decoration: BoxDecoration(
          color: ThemeColor.bottomStickyColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Padding(
        padding: getPadding(top: 18, bottom: 20, left: 16, right: 16),
        child: Column(
          children: [
            headingStart != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        headingStart,
                        style: TextViews.txtLatoRegular18
                            .copyWith(color: ThemeColor.textHintColor_1),
                      ),
                      Text(
                        headingEnd ?? "",
                        style: TextViews.txtLatoSemiBold18,
                      ),
                    ],
                  )
                : SizedBox.shrink(),
            headingStart != null
                ? SizedBox(
                    height: getVerticalSize(14),
                  )
                : SizedBox.shrink(),


            CustomButton(
              height: getVerticalSize(45),
              text: txtButton,
              variant: variant,
              shape: ButtonShape.RoundedRadius8,
              onTap: onButtonPressed,
            )
          ],
        ),
      ),
    );
  }

  static String formattedRemainingTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;

    if (hours == 0) {
      return '$minutes mins';
    } else {
      return '$hours hrs $minutes mins';
    }
  }
}

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(BuildContext context, String title)
// {
//   return ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(title)));
// }

String getAssetPath(String path) {
  return "assets/images/$path";
}

double widthScaled({required BuildContext context, required double pixels}) {
  return MediaQuery.of(context).size.width * (pixels / 360);
}

double heightScaled({required BuildContext context, required double pixels}) {
  return MediaQuery.of(context).size.height * (pixels / 800);
}

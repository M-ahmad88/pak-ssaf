import 'package:flutter/material.dart';

import '../../utils/color_constants.dart';
import '../../utils/size_utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        width ?? double.maxFinite,
        height ?? getVerticalSize(40),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      default:
        return getPadding(
          all: 0,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillprimaryColor:
        return ThemeColor.primaryColor;
      case ButtonVariant.Primary:
        return ThemeColor.primaryColor;
      case ButtonVariant.TextSecondaryColor:
        return ThemeColor.textSecondaryColor;
      case ButtonVariant.TextWhiteColor:
        return ThemeColor.textWhiteColor;
      case ButtonVariant.FillTextFieldBackgroundColor:
        return ThemeColor.textFieldBackgroundColor;

      default:
        return ThemeColor.bottomSheetColor;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.FillprimaryColor:
        return BorderSide(
          color: ThemeColor.primaryColor,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.Primary:
        return null;
      case ButtonVariant.FillTextFieldBackgroundColor:
        return BorderSide(
          width: 0,
          color: ThemeColor.textFieldBackgroundColor,
        );
      case ButtonVariant.TextSecondaryColor:
        return BorderSide(
          color: ThemeColor.textSecondaryColor,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.TextWhiteColor:
        return BorderSide(
          width: 0,
          color: ThemeColor.textWhiteColor,
        );
      default:
        return BorderSide(
          color: ThemeColor.textSecondaryColor,
          width: getHorizontalSize(
            1.00,
          ),
        );
    }
  }

  _setBorderRadius() {
    switch (shape) {

      case ButtonShape.Square:
        return BorderRadius.circular(0);

      case ButtonShape.RoundedBorder4:
        return BorderRadius.circular(4);
      case ButtonShape.RoundedRadius8:
        return BorderRadius.circular(8);
      case ButtonShape.RoundedRadius26:
        return BorderRadius.circular(getHorizontalSize(26));
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.LatoRegular14:
        return TextStyle(
          color: ThemeColor.textWhiteColor,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        );
        case ButtonFontStyle.LatoRegular12:
        return TextStyle(
          color: ThemeColor.textWhiteColor,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        );
        case ButtonFontStyle.LatoSemiBold12TextSecondary:
        return TextStyle(
          color: ThemeColor.textSecondaryColor,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600
        );//todo: font
      case ButtonFontStyle.LatoSemiBold14TextFieldBackground:
        return TextStyle(
          color: ThemeColor.textFieldBackgroundColor,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
        );
      default:
        return TextStyle(
          color: ThemeColor.textWhiteColor,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,

        );
    }
  }
}

enum ButtonShape {
  Square,
  CircleBorder20,
  RoundedBorder14,
  RoundedBorder4,
  RoundedRadius26,
  RoundedRadius8,
}

enum ButtonPadding { PaddingAll11, PaddingAll6 }

enum ButtonVariant {
  Greyyy,
  Primary,
  FillprimaryColor,
  TextSecondaryColor,
  FillTextFieldBackgroundColor,
  TextWhiteColor,
}

enum ButtonFontStyle { LatoSemiBold14,LatoSemiBold12TextSecondary, LatoRegular14, LatoRegular12, LatoSemiBold14TextFieldBackground }

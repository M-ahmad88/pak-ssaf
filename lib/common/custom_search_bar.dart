import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/color_constants.dart';
import '../utils/view_constants.dart';

class CustomSearchBar extends StatelessWidget {
  final String hint;
  final String? svgSuffix;
  final TextInputType textInputType;
  final VoidCallback filterCallback;
  final VoidCallback searchBarActive;
  final Function(String text) onTextChange;
  final bool autoFocus;
  final bool goToHomeScreen;

  const CustomSearchBar(
      {Key? key,
      this.svgSuffix,
      required this.hint,
      this.textInputType = TextInputType.text,
      required this.filterCallback,
      required this.searchBarActive,
      required this.onTextChange,
      this.autoFocus = false,
      this.goToHomeScreen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to clear search text

    return Container(
      height: ViewConstants.searchBarSize,
      margin: EdgeInsets.fromLTRB(
          0, heightScaled(context: context, pixels: 8), 0, 0),
      child: TextField(
        onChanged: onTextChange,
        autofocus: autoFocus,

        onTap: (){
          searchBarActive();
        },
        keyboardType: textInputType,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {

        },
        cursorColor: ThemeColor.textWhiteColor,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: const TextStyle(
                color: ThemeColor.textSecondaryColor01, fontSize: 15),
            hintText: hint,
            prefixIcon: IconButton(
              splashRadius: 0.1,
              onPressed: (){},
              icon: Icon(Icons.search_rounded,
                  color: ThemeColor.textSecondaryColor01),
            ),
            // suffixIcon: IconButton(
            //     splashColor: Colors.transparent,
            //     highlightColor: Colors.transparent,
            //     onPressed: filterCallback,
            //     icon: SvgPicture.asset("assets/images/ic_filter.svg")),
            fillColor: ThemeColor.textFieldBackgroundColor),
        style: const TextStyle(
            color: ThemeColor.textWhiteColor, fontSize: 16),
      ),
    );
  }


}

class CustomSearchBarWithOutFilter extends StatelessWidget {
  final String hint;
  final TextInputType textInputType;
  final bool autoFocus;
  final VoidCallback voidCallback;
  final Function(BuildContext context, String str) onInputChange;

  const CustomSearchBarWithOutFilter({
    Key? key,
    required this.hint,
    this.textInputType = TextInputType.text,
    this.autoFocus=false,
    required this.voidCallback,
    required this.onInputChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: heightScaled(context: context, pixels: 50),
      margin: EdgeInsets.fromLTRB(
          0, heightScaled(context: context, pixels: 8), 0, 0),
      child: TextField(

        onChanged: (value) => {
          onInputChange(context, value),
        },
        autofocus: autoFocus,
        onTap: voidCallback,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        cursorColor: ThemeColor.textWhiteColor,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: const TextStyle(color: ThemeColor.textHintColor_1),
            hintText: hint,
            prefixIcon: const Icon(Icons.search_rounded,
                color: ThemeColor.textWhiteColor),
            fillColor: ThemeColor.textFieldBackgroundColor),
        style: const TextStyle(color: ThemeColor.textFieldInputColor_1),
      ),
    );
  }
}

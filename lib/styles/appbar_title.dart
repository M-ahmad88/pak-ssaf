import 'package:flutter/material.dart';

import '../themes/text_styles.dart';
import '../utils/color_constants.dart';


class AppbarTitle extends StatelessWidget {
  AppbarTitle({required this.text, this.margin, this.onTap});

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextViews.txtLatoRegular18.copyWith(
            color: ThemeColor.textWhiteColor,
          ),
        ),
      ),
    );
  }
}

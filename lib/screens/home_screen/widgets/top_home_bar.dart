import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:core';

import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/icon_constants.dart';


Widget getTopHomeBar(BuildContext context, VoidCallback onUserProfileClicked) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextViews.textContainer(
                    text: Strings.salam_2,
                    textSize: 20,
                    textColor: ThemeColor.textWhiteColor),
                Expanded(
                  child: TextViews.textContainer(
                      overflow: TextOverflow.ellipsis,
                      text: "name of user",
                      textSize: 20,
                      textColor: ThemeColor.primaryColor),
                ),

                //TODO: might need to change the how its implemented in the future
                // FutureBuilder(
                //     future: getIt<SharedPreferencesService>()
                //         .getString(PrefConstants.person_fname),
                //     builder: (context, snapshot) {
                //       return TextViews.textContainer(
                //           overflow: TextOverflow.ellipsis,
                //           text: " Shoaib",
                //           textSize: 20,
                //           textColor: ThemeColor.primaryColor);
                //     })
              ],
            ),
            SizedBox(
              height: 4,
            ),
            TextViews.textContainer(overflow: TextOverflow.ellipsis,
                text: Strings.what_would_you_like_to,
                textSize: 14,
                textColor: ThemeColor.textSecondaryColor01)
          ],
        ),
      ),
           Row(
              children: [
                //TODO: might be needed in future to in case revamped ui is reversed
                // InkResponse(
                //   radius: 25,
                //   onTap: (){
                //     Navigator.push(context, rightToLeft(NotificationScreen(), null));
                //   },
                //   child: SvgPicture.asset(IconConstants.ic_notification_dot,
                //       height: 28, width: 28),
                // ),
                // const SizedBox(
                //   width: 12,
                // ),
                InkResponse(
                  radius: 25,
                  onTap: onUserProfileClicked,
                  child: SvgPicture.asset(IconConstants.ic_person,
                      height: 28, width: 28),
                ),
              ],
            )

    ],
  );
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/text_styles.dart';
import '../utils/color_constants.dart';
import '../utils/view_constants.dart';

void showOverlayToast(BuildContext context, String msg)
{
  OverlayEntry entry = OverlayEntry(builder: (context){
    return toastMessage(context, msg);
  });
  Overlay.of(context)?.insert(entry);
  Future.delayed(const Duration(seconds: 3)).then((value) => entry.remove());
}

Widget toastMessage(BuildContext context, String msg)
{
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.12,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
          width: MediaQuery.of(context).size.width*0.9,
          height: heightScaled(context: context, pixels: 40),
          alignment: Alignment.center,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(7),
            color: ThemeColor.textWhiteColor
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Card(
              color: ThemeColor.transparent,
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: TextViews.textContainer(text: msg, textSize: 12, textColor: ThemeColor.toastMessageColor),
              ),
            ),
          ),
        ));

  // //show overlay
  // Overlay.of(context)!.insert(entry);
  // //auto remove this overlay after 3 seconds
  // Future.delayed(const Duration(seconds: 3)).then((value) => entry.remove());
}
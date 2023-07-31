import 'package:flutter/material.dart';


import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/icon_constants.dart';
import '../../utils/view_constants.dart';

class PlayingAudioWidget extends StatelessWidget {
  const PlayingAudioWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScaled(context: context, pixels: 60.3),
      width:  widthScaled(context: context, pixels: 240),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ThemeColor.shadow,
              blurRadius: 20.0, // soften the shadow
              spreadRadius: 3.0, //extend the shadow
              offset: Offset(
                5.0, // Move to right 5  horizontally
                20.0, // Move to bottom 5 Vertically
              ),
            )
          ],
          color: ThemeColor.whiteSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      // margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: const CircularProgressIndicator(
                      strokeWidth: 1.5,
                      value: 1,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          ThemeColor.primaryColor),
                    ),
                  ),
                ),
                Center(
                  child: ClipOval(
                    child: SizedBox(
                      width: 29,
                      height: 29,
                      // size: const Size.fromRadius(18.5),
                      child: Container(
                        height: 29,
                        width: 29,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColor
                                .textFieldBackgroundColor),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: const Icon(
                    Icons.recycling,
                    color: ThemeColor.textWhiteColor,
                    size: 24,
                  ),
                )
              ],
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //       minimumSize: const Size(30, 30),
          //       shape: const CircleBorder(),
          //       backgroundColor: ThemeColor.secondaryColor),
          //   child: const Icon(
          //     Icons.play_arrow_rounded,
          //     color: ThemeColor.textWhiteColor,
          //     size: 24,
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.slogan2,
                    style: TextViews.txtLatoRegular12.copyWith(color: ThemeColor.secondaryColor),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2.2, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextViews.textContainer(text: Strings.uk_london, textSize: 10),
                        TextViews.textContainer(text: Strings.aug_22, textSize: 10),
                        TextViews.textContainer(text: Strings.min_25, textSize: 10, textColor: ThemeColor.primaryColor),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}





import 'package:flutter/material.dart';


import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/icon_constants.dart';
import '../../utils/size_utils.dart';
import '../../utils/view_constants.dart';

class PlayingAudioSecondaryWidget extends StatelessWidget {
  const PlayingAudioSecondaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScaled(context: context, pixels: 53),
      width: widthScaled(context: context, pixels: 178),
      decoration: const BoxDecoration(
          color: ThemeColor.whiteShadeColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      // margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      child: Row(
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
          Expanded(
            child: Padding(
              padding: getPadding(left: 8, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(
                Strings.slogan2,
                style: TextViews.txtLatoRegular12.copyWith(color: ThemeColor.secondaryColor),
              ),
                 ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

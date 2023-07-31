import 'package:flutter/material.dart';


import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/icon_constants.dart';
import '../../utils/size_utils.dart';
import '../../utils/view_constants.dart';
class BackgroundYellowishCard extends StatelessWidget {
  const BackgroundYellowishCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthScaled(context: context, pixels: 198),
      height: getVerticalSize(180),
      decoration: const BoxDecoration(
          color: ThemeColor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            0, heightScaled(context: context, pixels: 10), 0, 0),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        minimumSize: const Size(30, 30),
                        backgroundColor: ThemeColor.textWhiteColor),
                    child:Icon(
                      Icons.recycling,
                      color: ThemeColor.primaryColor,
                      size: 24,
                    ),),
                TextViews.textContainer(text: Strings.app_name, textSize: 20, textColor: ThemeColor.textWhiteColor),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

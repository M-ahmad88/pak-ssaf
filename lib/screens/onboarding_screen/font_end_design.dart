import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';

import '../../common/button_widget.dart';
import '../../common/custom_animation.dart';
import '../../utils/view_constants.dart';
import '../login_screen/login_screen.dart';
import '../main_bottom_nav/main_home_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/icon_constants.dart';
import 'Playing Audio Secondary Widget.dart';
import 'Playing Audio Widget.dart';
import 'background_yellowish_card.dart';

class FrontEndDesign extends StatelessWidget {
  FrontEndDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(mainAxisAlignment:MainAxisAlignment.end,
            children: [

              Image.asset("assets/images/logo1.png", height:200,width:200),
              SizedBox(height: 150,),
              TextViews.textContainer(
                  edgeInsets: EdgeInsets.only(
                      top: heightScaled(context: context, pixels: 85)),
                  text: Strings.slogan,
                  textSize: 24,
                  textColor: ThemeColor.textWhiteColor,
                  fontWeight: FontWeight.w700),
              TextViews.textContainer(
                  text: Strings.slogan1,
                  textSize: 24,
                  textColor: ThemeColor.primaryColor,
                  fontWeight: FontWeight.w700),
              TextViews.textContainer(
                  edgeInsets: EdgeInsets.only(
                      top: heightScaled(context: context, pixels: 16),
                      left: heightScaled(context: context, pixels: 20),
                      right: heightScaled(context: context, pixels: 20)),
                  text: Strings.lorum_ipsum,
                  textSize: 13,
                  textColor: ThemeColor.textFieldInputColor_1,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
        Padding(
          padding: ViewConstants.scaledEdgeInsets(
              context: context, bottom: 30, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ButtonWidgets.outlinedBorderButton(
                    radius: 8,
                    text: Strings.sign_up,
                    edgeInsets: const EdgeInsets.only(right: 4),
                    voidCallback: () {
                      Navigator.of(context).push(bottomToTop(SignUpScreen()));
                    }),
              ),
              Expanded(
                child: ButtonWidgets.outlinedSignUpButton(
                    radius: 8,
                    text: Strings.sign_in,
                    edgeInsets: const EdgeInsets.only(left: 4),
                    voidCallback: () {
                      Navigator.of(context).push(bottomToTop(LoginScreen()));
                    },),
              ),
            ],
          ),
        )
      ],
    );
  }
}

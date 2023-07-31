import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/icon_constants.dart';
import '../../common/custom_animation.dart';
import '../../utils/view_constants.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    runCodeOnceAfterDelay();
    Timer(Duration(seconds: ViewConstants.splashScreenDuration),
            () =>  Navigator.pushReplacement(
                context, rightToLeft(const OnBoardingScreen(), null)));

  }

  void runCodeOnceAfterDelay() {
    bool hasRun = false;
    Timer(Duration(seconds: 3), () {
      if (!hasRun) {
        // Code block to run after 3 seconds
        print('Code executed after 3 seconds');
        hasRun = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Stack(children: [
          Column(
            children: [
              Expanded(
                  child: Icon(
                    Icons.recycling,
                    color: ThemeColor.primaryColor,
                    size: 100,
                  ),),
              Align(
                alignment: Alignment.topLeft,
                child: LoadingAnimationWidget.hexagonDots(
                    color: ThemeColor.textWhiteColor, size: 30),
              ),
            ],
          ),
        ]),
      ),
    );
  }


}

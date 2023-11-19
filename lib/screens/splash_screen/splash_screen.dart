import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pak_saaf/screens/onboarding_screen/onboarding_screen.dart';
import '../../../utils/color_constants.dart';
import '../../common/custom_animation.dart';
import '../../utils/view_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: ViewConstants.splashScreenDuration),
            () =>  Navigator.pushReplacement(
                context, rightToLeft( OnBoardingScreen(), null)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.secondaryColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ThemeColor.secondaryColor, ThemeColor.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Stack(children: [
            Column(
              children: [
                Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 141,
                            height: 141,
                            decoration: const ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.00, -1.00),
                                end: Alignment(0, 1),
                                colors: [Color(0xFF36B084), Color(0x0036B084), Color(0xFC36B084)],
                              ),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                             Text(
                            'Saaf',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF33363F),
                              fontSize: 70,
                              fontFamily: 'Timmana',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 5,
                              shadows: [
                                Shadow(
                                  offset: Offset(2.0, 2.0), // Adjust the values for the desired shadow position
                                  blurRadius: 3.0, // Adjust the blur radius for the desired shadow effect
                                  color: Colors.white, // Adjust the shadow color
                                ),
                              ],
                            ),),
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.recycling,
                                color: ThemeColor.primaryColor,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: LoadingAnimationWidget.hexagonDots(
                      color: ThemeColor.textWhiteColor, size: 30),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }


}

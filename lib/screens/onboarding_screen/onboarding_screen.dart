import 'package:flutter/material.dart';
import 'curved_container_main.dart';
import 'font_end_design.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
          fit: StackFit.loose,
          children:  [
            CurvedContainer(),
            FrontEndDesign()
          ]
      ),
    );
  }


}



import 'package:flutter/material.dart';
import 'package:pak_saaf/common/button_widget.dart';
import 'package:pak_saaf/common/scaffold_app_bar.dart';
import '../../common/custom_animation.dart';
import '../../../string_en.dart';
import '../qr_scanner/qr_scan_screen.dart';

class MainHomeScreen extends StatefulWidget {
  double bottomNavPadding = 0;
  bool userRegisterSuccessfully = false;

  MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: scaffoldAppBar(context, Strings.welcome_home),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 0.0),
            ButtonWidgets.outlinedButton(
                radius: 8,
                text: Strings.scan_me,
                edgeInsets: const EdgeInsets.only(right: 4),
                voidCallback: () {
                  Navigator.of(context).push(bottomToTop(QRScanScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pak_saaf/common/button_widget.dart';
import 'package:pak_saaf/common/scaffold_app_bar.dart';
import 'package:pak_saaf/models/userModel.dart';
import 'package:pak_saaf/utils/global.dart';
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

    /*var points = userModelCurrentInfo!.points;*/
    return Scaffold(
      appBar: scaffoldAppBar(context, Strings.welcome_home),
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Text(result != null ? result!.code.toString() : "0",   style: TextStyle(fontSize: 180), ),

         /* Text(userModelCurrentInfo!.points.toString(), style: TextStyle(fontSize: 180), ),*/

          SizedBox(height: 100,),
          Container(
            height: 90,
            child: Expanded(
              child:   ButtonWidgets.outlinedButton(
                  radius: 8,
                  text: Strings.scan_me,
                  edgeInsets: const EdgeInsets.all(12),
                  voidCallback: () {
                    Navigator.of(context).push(bottomToTop(QRScanScreen()));
                  }),
            ),
          ),
          Container(
            height: 90,
            child: Expanded(
              child:   ButtonWidgets.outlinedButton(
                  radius: 8,
                  text: Strings.redeem,
                  edgeInsets: const EdgeInsets.all(12),
                  voidCallback: () {
                    Navigator.of(context).push(bottomToTop(QRScanScreen()));
                  }),
            ),
          )
        ],
      ),
    );
  }


}
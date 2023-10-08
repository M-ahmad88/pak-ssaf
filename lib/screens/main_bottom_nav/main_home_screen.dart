import 'package:flutter/material.dart';
import 'package:pak_saaf/common/AssistantMethods.dart';
import 'package:pak_saaf/common/button_widget.dart';
import 'package:pak_saaf/common/scaffold_app_bar.dart';
import 'package:pak_saaf/utils/color_constants.dart';
import 'package:pak_saaf/utils/global.dart';
import 'package:url_launcher/url_launcher.dart';
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
    var userName = userModelCurrentInfo?.name ?? "User";
    return Scaffold(
      appBar: scaffoldAppBar(context, Strings.welcome_home),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: ThemeColor.secondaryColor,
                  ),
                  child: Center(
                    child: Text(
                      result != null ? result!.code.toString() : "12 pts",
                      style: const TextStyle(
                        fontSize: 60,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ButtonWidgets.outlinedButton(
                        radius: 8,
                        text: Strings.scan_me,
                        edgeInsets: const EdgeInsets.all(12),
                        voidCallback: () {
                          Navigator.of(context).push(bottomToTop(QRScanScreen()));
                        },
                      ),
                    ),
                    Expanded(
                      child: ButtonWidgets.outlinedButton(
                        radius: 8,
                        text: Strings.redeem,
                        edgeInsets: const EdgeInsets.all(12),
                        voidCallback: () {
                          Navigator.of(context).push(bottomToTop(QRScanScreen()));
                        },
                      ),
                    ),
                  ],
                ),


                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          const url = 'https://www.britannica.com/science/recycling/Ferrous-metals';
                          launch(url); // Open the URL when the card is tapped
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [ThemeColor.secondaryColor, ThemeColor.primaryColor], // Customize gradient colors
                              ),
                            ),
                            child: Column(
                              children:  [
                                Padding(
                                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                                  child:

                                  Text(
                                    "Hey Valued Customer",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16.0,right: 16.0, bottom: 16.0, top: 0.0),
                                  child: Text(
                                    "We're delighted that you're contributing to recycling efforts. Thank you!\nTo learn more about recycling waste click here! ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Text(
                  "OFFERS", // Text above the cards
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.icecream), // Icon at the left corner
                    title: Text("Get A McDonalds McFlurry"),
                    subtitle: Text("30 pts required"),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.discount), // Icon at the left corner
                    title: Text("Get A 1000 Discount At Carrefour"),
                    subtitle: Text("80 pts required"),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.car_crash_outlined), // Icon at the left corner
                    title: Text("Get 50% off Your Next Yango Ride"),
                    subtitle: Text("180 pts required"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )

    ;
  }
}

import 'package:flutter/material.dart';
import 'package:pak_saaf/common/button_widget.dart';
import 'package:pak_saaf/common/scaffold_app_bar.dart';
import 'package:pak_saaf/utils/color_constants.dart';
import 'package:pak_saaf/utils/global.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common/custom_animation.dart';
import '../../../string_en.dart';
import '../../utils/view_constants.dart';
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
      appBar: scaffoldAppBar(context, "Welcome $userName"),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ThemeColor.secondaryColor, ThemeColor.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            margin: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // Center align the children
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      top: 50.0,
                                      bottom: 50),
                                  child: Text(
                                    "$points pts",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Add your vector or icon here
                                Icon(
                                  Icons.star, // Replace with the desired icon
                                  color: Colors.pink,
                                  size: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /*Row(
                    children: [
                      const Text(
                        "OFFERS", // Text above the cards
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),*/
                  /* const Card(
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
                      leading: Icon(Icons.car_crash_outlined),
                      // Icon at the left corner
                      title: Text("Get 50% off Your Next Yango Ride"),
                      subtitle: Text("180 pts required"),
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          'Redeem Now',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 16), // Add some spacing between the text and the TextField
                        Container(
                          width: 150, // Set the desired width for the TextField
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0), // Optional: Add rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey, // Shadow color
                                  offset: Offset(0, 3), // Offset of the shadow
                                  blurRadius: 6, // Blur radius of the shadow
                                ),
                              ],
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter points here",
                                contentPadding: EdgeInsets.all(10.0), // Optional: Adjust content padding
                                border: InputBorder.none, // Hide the default border
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 150,
                        height: 150,
                        margin: ViewConstants.scaledEdgeInsets(context: context, top: 40),
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(bottomToTop(QRScanScreen()));
                          },
                          child:Transform.scale(
                            scale: 3, // Adjust the scale factor to increase icon size
                            child: Icon(Icons.qr_code),
                          ),
                          // Replace with the icon you want
                          backgroundColor: ThemeColor.secondaryColor, // Set the background color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

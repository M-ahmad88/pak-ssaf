import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pak_saaf/screens/about_screen.dart';
import 'package:pak_saaf/screens/login_screen/login_screen.dart';
import 'package:pak_saaf/utils/color_constants.dart';
import 'package:pak_saaf/utils/global.dart';
import '../../common/custom_animation.dart';
import '../../utils/view_constants.dart';
import '../qr_scanner/qr_scan_screen.dart';
import '../redeem_now.dart';

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
      appBar: scaffoldAppBarForHomeScreen(context, "Welcome $userName"),
      drawer: buildDrawer(context),
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
                  ),*/
                  buildHorizontalCarousel(context),

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
                 /* Padding(
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
                  ),*/

                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 100,
                        height: 100,
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


Widget buildDrawer(context) {
  return Drawer(
    backgroundColor: ThemeColor.textHintColor_2,
    child: Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: ThemeColor.textSecondaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0, 2), // Offset of the shadow
                        blurRadius: 4, // Blur radius of the shadow
                        spreadRadius: 1, // Spread radius of the shadow
                      ),
                    ], // Use your desired light grey color
                  ),
                  child: Text(
                    'Welcome $userName', // Display the user's name
                    style: TextStyle(
                      color: Colors.black, // Set the text color
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.black), // Black icon
                title: Text(
                  'Help',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutScreen();
                  }));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.black), // Black icon
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.celebration_rounded, color: Colors.black), // Black icon
                title: Text(
                  'Redeem Now',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RedeemScreen();
                  }));
                },
              ),
              Divider(),

            ],
          ),
        ),
        // Log Out Button
        Divider(),
        ListTile(
          leading: Icon(Icons.logout, color: Colors.black), // Black icon
          title: Text(
            'Log Out',
            style: TextStyle(color: Colors.black),
          ),
          onTap: () async {
              // Call the signOut function when the button is pressed
            await fAuth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));

          },
        ),
      ],
    ),
  );
}



PreferredSizeWidget scaffoldAppBarForHomeScreen(BuildContext context, String title) {


  return AppBar(
    title: Text(title,
        style:
        const TextStyle(fontSize: 18, color: ThemeColor.textWhiteColor, fontWeight: FontWeight.bold)),
    backgroundColor: ThemeColor.secondaryColor,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.menu,
            color: Colors.black,),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
  );
}


Widget buildHorizontalCarousel(context) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200.0,
      enlargeCenterPage: true,
    ),
    items: [
      buildCarouselItem(
        'https://www.britannica.com/science/recycling',
        'Recycle',
        'Recycling reclaims materials, minimizing waste and promoting sustainability.',
        context
      ),
      buildCarouselItem(
        'https://www.wm.com/us/en/recycle-right/recycling-101',
        'Reduce',
        '"Reduce" urges minimalism to curb waste and foster sustainable living.',
          context
      ),
      buildCarouselItem(
          'https://en.wikipedia.org/wiki/Reuse#:~:text=Reuse%20is%20the%20action%20or,the%20manufacture%20of%20new%20products.',
          'Reuse',
          '"Reuse" maximizes item lifespan, minimizing waste for sustainability.',
          context
      ),
    ],
  );
}

Widget buildCarouselItem(String url, String title, String content, context) {
  return Card(
    // Customize the appearance of your carousel item card
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    margin: EdgeInsets.all(16.0),
    child: Container(
      width: MediaQuery.of(context).size.width - 32, // Adjust card width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ThemeColor.secondaryColor,
            ThemeColor.primaryColor,
          ],
        ),
      ),
      child: Column(
        children: [
          // Customize the content of your carousel item
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          // Add more content as needed
        ],
      ),
    ),
  );
}




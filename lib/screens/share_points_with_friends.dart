import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pak_saaf/common/AssistantMethods.dart';
import 'package:pak_saaf/screens/main_bottom_nav/main_home_screen.dart';
import 'package:pak_saaf/utils/global.dart';
import '../common/toast_message.dart';
import '../utils/color_constants.dart';
import '../utils/progress_dialog.dart';

class SharePointsScreen extends StatelessWidget {
  var phoneNumberOfFriend;
  var pointsToShare;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Share Points"),
        foregroundColor: ThemeColor.black900,
        backgroundColor: ThemeColor.secondaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ThemeColor.secondaryColor, ThemeColor.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Share Points Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF33363F),
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                child: Text(
                  'Now You Can Share Points With Your Friends',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF33363F),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey, // shadow color
                              blurRadius: 10, // blur radius
                              offset: Offset(0, 3), // shadow offset
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 20, bottom: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Enter Mobile No Of Your Friend',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color(0xFF615F5F),
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w500,
                                    height: 0.06,
                                    letterSpacing: 0.30,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Container(
                                height: 47,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      phoneNumberOfFriend = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 40, bottom: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Enter Number of Points to Share",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Color(0xFF615F5F),
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w500,
                                    height: 0.06,
                                    letterSpacing: 0.30,
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: 0.8,
                              child: Container(
                                height: 47,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none),
                                    onChanged: (value) {
                                      pointsToShare = value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: ThemeColor.secondaryColor,
                                      minimumSize:
                                          const Size(double.infinity, 45),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (phoneNumberOfFriend != null && pointsToShare != null && phoneNumberOfFriend.toString().isNotEmpty && pointsToShare.toString().isNotEmpty ){
                                        checkUserBeforeLogin(context: context);
                                      }
                                      else{
                                        Fluttertoast.showToast(msg: "Enter a valid value for phone number and value");

                                      }


                                    },
                                    child: Text("Share Now"),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  // Call this function before logging in
  void checkUserBeforeLogin({required BuildContext context}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext c) {
        return ProgressDialog(message: "Checking user existence, Please wait...",);
      },
    );

    String email = "$phoneNumberOfFriend@gmail.com";

    bool userExists = await isUserExists(email);

    Navigator.pop(context); // Dismiss the progress dialog

    if (userExists) {
      // User exists, proceed with login
      int? pointsToShareValue = int.tryParse(pointsToShare);
      if(pointsToShareValue! <= points && pointsToShareValue! >= 1){

        DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");
        Query query = userRef.orderByChild("email").equalTo(email);

        DatabaseEvent snapshot = await query.once();
        if (snapshot.snapshot.value != null) {
          Map<String, dynamic>? userData =
          (snapshot.snapshot.value as Map<dynamic, dynamic>).cast<String, dynamic>();

          if (userData != null && userData.isNotEmpty) {
            String userId = userData.keys.first;

          int currentPoints = userData[userId]['points'] ?? 0;
          // Update points by adding pointsToAdd
          int newPoints = currentPoints + pointsToShareValue;

          // Update the points in the database
          await userRef.child(userId).update({"points": newPoints});

          subtractPointsFromCurrentUser(context, pointsToShareValue);

            AssistantMethod.getPointsOfUser().then((_) {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MainHomeScreen();
              }));
            });

        } else{
            print("Invalid user data");
            Fluttertoast.showToast(msg: "Invalid user data");

          }
        }
      }
      else{
        Fluttertoast.showToast(msg: "Please enter pts between 1 and $points");
      }
    } else {
      // User does not exist
      Fluttertoast.showToast(msg: "This User Does Not Exist");
      // You can handle this case as needed
    }
  }

  Future<bool> isUserExists(String email) async {
    DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");
    DatabaseEvent snapshot = await userRef.orderByChild("email").equalTo(email).once();

    return snapshot.snapshot.value != null;
  }

  subtractPointsFromCurrentUser(BuildContext context, int pointsToShareValue){

    DatabaseReference userRef = FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(currentFirebaseUser!.uid);


    userRef.update({'points': points-pointsToShareValue}).then((_) {
    }).catchError((error) {
      print("Error updating points: $error");
      toastMessage(context, "Error updating points");
      Navigator.pop(context);
    });
  }







}

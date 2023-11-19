import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pak_saaf/common/toast_message.dart';
import 'package:pak_saaf/screens/login_screen/login_screen.dart';
import 'package:pak_saaf/screens/main_bottom_nav/main_home_screen.dart';
import '../../common/AssistantMethods.dart';
import '../../common/custom_animation.dart';
import '../../utils/color_constants.dart';
import '../../utils/global.dart';

class OtpScreen extends StatefulWidget {


  final String phoneNumber;
  final String password;
  final String UserName;
  final String verificationId;

  const OtpScreen({
    Key? key,
    required this.phoneNumber,
    required this.password,
    required this.UserName,
    required this.verificationId
  }) : super(key: key);



  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? otp;
  bool isLoading = false;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify OTP"),
        foregroundColor:ThemeColor.black900 ,
        backgroundColor:    ThemeColor.secondaryColor,
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
                 "Enter OTP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF33363F),
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),



              const SizedBox(height: 100,),
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
                              padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Enter OTP",
                                  textAlign: TextAlign.start,
                                  style:  TextStyle(
                                    color: Color(0xFF615F5F),
                                    fontSize: 18,
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
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: textController,
                                    decoration: const InputDecoration(border: InputBorder.none , enabledBorder: InputBorder.none),
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      setState(() {
                                        otp = value;
                                      });

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
                                      minimumSize: const Size(double.infinity, 45),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      ),

                                    onPressed: () {

                                        verifyOTP();

                                    },
                                    child:  Text("Verify OTP"),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,)
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



    /*
              TextField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'OTP'),
                onChanged: (value) {
                  setState(() {
                    otp = value;
                  });
                },
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: sendOTP,
                child: Text("Send OTP"),
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: verifyOTP,
                child: Text("Verify OTP"),
              ),*/


  }

  final PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) {
    // This function can remain empty or perform any necessary actions upon verification.
  };



/*
  bool isPasswordValid(String password) {
    // Define your password criteria here.
    // For example, you can require a minimum length and specific character types.

    // Minimum length requirement
    if (password.length <= 8) {
      toastMessage(context, "Password should be atleast 8 characters");
      return false;
    }
    else{
      return true;
    }

  }
*/



  Future<void> verifyOTP() async {

    setState(() {
      isLoading = true;
    });

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp!,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        setState(() {
          isLoading = false;
        });

        await signUpWithEmailAndPassword(widget.phoneNumber,widget.password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("OTP Verified!"),
        ));

      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid OTP"),
        ));
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error verifying OTP: $e"),
      ));
    }
  }



  Future<void> signUpWithEmailAndPassword(String phoneNumber, String password) async {
    try {
      UserCredential userCredential = await fAuth.createUserWithEmailAndPassword(
        email: "$phoneNumber@gmail.com",
        password: password,
      );

      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        Map<String, dynamic> userMap = {
        "id": firebaseUser.uid,
        "number": phoneNumber,
          "email": "$phoneNumber@gmail.com",
          "points": 0,
          "password":password,
          "name": userName
        // You can add more user information here if needed
      };

      DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");
      userRef.child(firebaseUser.uid).set(userMap);

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Account created");

        await AssistantMethod.getPointsOfUser();
        await AssistantMethod.getNameOfUser();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainHomeScreen();
        }));
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "Account is not created");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }







}

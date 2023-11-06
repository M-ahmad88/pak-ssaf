import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pak_saaf/common/AssistantMethods.dart';
import 'package:pak_saaf/common/toast_message.dart';
import 'package:pak_saaf/screens/main_bottom_nav/main_home_screen.dart';
import '../../common/button_widget.dart';
import '../../common/checkbox_widget.dart';
import '../../common/custom_animation.dart';
import '../../common/input_text_field_widget.dart';
import '../../common/password_field_widget.dart';
import '../../common/scaffold_app_bar.dart';
import '../../forgot_password_screen.dart';
import '../../utils/global.dart';
import '../../utils/progress_dialog.dart';
import '../../utils/view_constants.dart';
import '../sign_up_screen/sign_up_screen.dart';
import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../splash_screen/splash_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  bool shouldRemember = false;



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phoneNumber;
  var password;
  bool isButtonEnabled = false;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In Screen"),
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
                'Sign In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF33363F),
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignUpScreen();
                  }));
                },
                child: Text(
                  "Don't have an account? Sign In here.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF33363F),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    letterSpacing: 0.30,
                  ),
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

                                  'Enter Mobile No',
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

                                    decoration: const InputDecoration(border: InputBorder.none , enabledBorder: InputBorder.none),
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {

                                      setState(() {
                                        phoneNumber = value;
                                      });


                                    },
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 30),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Enter Password",
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
                                    obscureText: true,
                                    decoration: const InputDecoration(border: InputBorder.none , enabledBorder: InputBorder.none),
                                    onChanged: (value) {

                                      setState(() {
                                        password = value;
                                       });

                                    },
                                  ),
                                ),
                              ),
                            ) ,

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
                                      validateForm();
                                      },
                                    child:  Text( "Sign In"),
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
  validateForm()
  {
    if(password == null || password.isEmpty)
    {
      Fluttertoast.showToast(msg: "Password is required.");
    }
    else
    {

      loginDriverNow();
    }

  }
  loginDriverNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: "$phoneNumber@gmail.com",
          password: password,
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error: " + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
    {
      DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");
      userRef.child(firebaseUser.uid).once().then((userMap)
      async {
        final snap = userMap.snapshot;
        if(snap.value != null)
        {
          currentFirebaseUser = firebaseUser;
          Fluttertoast.showToast(msg: "Login Successful.");

          await AssistantMethod.getPointsOfUser();
          Navigator.of(context).push(bottomToTop(MainHomeScreen()));
        }
        else
        {
          Fluttertoast.showToast(msg: "No record exist with this email.");
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const SplashScreen()));
        }
      });
    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error Occurred during Login.");
    }
  }

/* Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      appBar: scaffoldAppBar(context, Strings.sign_in),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        // controls bottom overflow if keyboard opens
        child: Container(
          height: height - ViewConstants.appBarSize,
          padding: ViewConstants.scaledEdgeInsets(
              context: context, left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextViews.textHeading_22(
                  text: Strings.welcome,
                  edgeInsets: const EdgeInsets.only(top: 20)),
              TextViews.textSecondary_12(
                  text: Strings.sign_in_to_your_account,
                  edgeInsets: const EdgeInsets.only(top: 6)),
              InputTextWidget(
                textEditingController: widget.emailController,
                label: Strings.email,
                hint: Strings.enter_email,
                onTextChange: (text) {
                },
              ),
              PasswordFieldWidget(
                textEditingController: widget.passwordController,
                label: Strings.password,
                hint: Strings.enter_password,
                onTextChange: (text) {
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckBoxWidget(
                      text: Strings.remember_me,
                      shouldRemember: (value) {
                        widget.shouldRemember = value;
                      }),
                  ButtonWidgets.textButton(
                      text: Strings.forgot_password,

                      voidCallback: () {
                        Navigator.push(
                            context,
                            rightToLeft(
                                ForgotPasswordScreen(),
                                null));
                        // forgotPasswordBottomSheet(context);
                      },
                      rippleColor: ThemeColor.textRippleBlue,
                      textColor: ThemeColor.textBlueColor)
                ],
              ),

              ButtonWidgets.outlinedSignUpButton(

                text: Strings.sign_in,
                edgeInsets: EdgeInsets.fromLTRB(
                    0, heightScaled(context: context, pixels: 32), 0, 0),
                voidCallback: () {
                  validateForm();


                },
                enabled: isButtonEnabled,

              ),


              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, heightScaled(context: context, pixels: 20), 0,
                      heightScaled(context: context, pixels: 20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: Strings.dont_have_account,
                            style: TextViews
                                .txtLatoRegular14Secondary,
                          ),
                          TextSpan(
                              text: Strings.sign_up,
                              style: TextViews.txtLatoBold12Primary.copyWith(fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                      context,
                                      rightToLeft(SignUpScreen(), null));
                                }
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}




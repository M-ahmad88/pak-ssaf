
import 'dart:collection';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pak_saaf/screens/sign_up_screen/OtpScreen.dart';
import 'package:pak_saaf/utils/global.dart';

import '../../common/custom_animation.dart';
import '../../common/custom_button.dart';
import '../../common/drop_down_widget.dart';
import '../../common/input_text_field_widget.dart';
import '../../common/password_field_widget.dart';
import '../../common/scaffold_app_bar.dart';
import '../../string_en.dart';
import '../../themes/text_styles.dart';
import '../../utils/color_constants.dart';
import '../../utils/progress_dialog.dart';
import '../../utils/size_utils.dart';
import '../../utils/view_constants.dart';
import '../login_screen/login_screen.dart';
import '../main_bottom_nav/main_home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool value = false;
  String? name;
  String? number;
  String? password;
  late String verificationId;
  String? confirmPassword;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool isTermsAndConditionChecked = false;
  bool formValid = false;

  validateForm(){

    if (name == null || name!.isEmpty ||
        number == null || number!.isEmpty ||
        password == null || password!.isEmpty ||
        confirmPassword == null || confirmPassword!.isEmpty) {
      Fluttertoast.showToast(msg: "Required fields can not be empty");
    }

    else if (name!.length <= 3 ){
      Fluttertoast.showToast(msg: "name must be more than 3 characters ");
    }

    else if ( password!.length <= 8 ){
      Fluttertoast.showToast(msg: "Password must be more than 8 characters ");
    }

    else if (password! != confirmPassword!){
      Fluttertoast.showToast(msg: "Passwords do not match");
    }


    else{
      setState(() {
        isLoading  = true;
        formValid = true;
      });
    }
  }

 /* saveUserInfo() async{
    final User? firebaseUser = (
        await fAuth.createUserWithEmailAndPassword(
            email: email!.trim(), password: password!.trim()
        ).catchError((msg){
          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(msg: "Error: "+ msg.toString());
        })
    ).user;

    if (firebaseUser != null){
      Map userMap = {
        "id": firebaseUser.uid,
        "name": name,
        "userName": userName,
        "email": email

      };
      DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");
      userRef.child(firebaseUser.uid).set(userMap);
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "account created");
      Navigator.of(context).push(bottomToTop(MainHomeScreen()));
    }
    else{
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "account is not created");
    }



  }*/

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return Scaffold(
      appBar: scaffoldAppBar(context, Strings.sign_up),
    /*  bottomNavigationBar: isLoading
          ? Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Stack(
            alignment: Alignment.center,
            children: [

              ViewConstants.bottomSheetButtonWidget(
                variant: ButtonVariant.FillprimaryColor, onButtonPressed: ()async {  },),
              Positioned(
                top: heightScaled(context: context, pixels: 30),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 3,
                  ),
                ),
              ),]
        ),
      )
          : Padding(
        padding: MediaQuery.of(context).viewInsets,
        child:
        ViewConstants.bottomSheetButtonWidget(txtButton:  Strings.sign_up,variant: ButtonVariant.FillprimaryColor, onButtonPressed: ()  {

          validateForm();
        }

        )

        ,
      ),*/
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ThemeColor.secondaryColor, ThemeColor.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 10, 32, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InputTextWidget(
                isMandatory: true,
                paddingTop: getVerticalSize(16),
                label: Strings.full_name,
                hint: Strings.full_name,
                onTextChange: (text) {
                  name = text;
                },
              ),

              InputTextWidget(
                isMandatory: true,
                paddingTop: getVerticalSize(16),
                label: Strings.phoneNumber,
                hint: Strings.numberFormat,
                onTextChange: (text) {
                  number = text;
                },
              ),

              PasswordFieldWidget(
                  isMandatory: true,
                  label: Strings.password,
                  hint: Strings.enter_password,
                  onTextChange: (text) {
                    password = text;

                  }),
              PasswordFieldWidget(
                  isMandatory: true,
                  label: Strings.confirm_password,
                  hint: Strings.enter_password,
                  onTextChange: (text) {
                    confirmPassword = text;
                  }),
              Padding(
                padding: EdgeInsets.only(
                    left: widthScaled(context: context, pixels: 6),
                    top: widthScaled(context: context, pixels: 15)),
                child: Row(
                    children: [
                      Padding(
                        padding: getPadding(bottom: 0),
                        child: InkWell(
                          onTap: (){
                            isTermsAndConditionChecked = true;
                            setState(() {
                              value = !value;
                            });
                          },
                          child: Container(
                            height: heightScaled(context: context, pixels: 16),
                            width: widthScaled(context: context, pixels: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius:BorderRadius.circular(4),
                                color: value?ThemeColor.primaryColor:ThemeColor.textSecondaryColor,
                                border:Border.all(width: 2, color: ThemeColor.textSecondaryColor)
                            ),
                            child: Checkbox(
                              checkColor: ThemeColor.secondaryColor,
                              activeColor: ThemeColor.primaryColor,
                              side: const BorderSide(width: 2, color: ThemeColor.textSecondaryColor),
                              value: value,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              onChanged: (bool? value) {
                                isTermsAndConditionChecked = true;
                                ;
                                setState(() {
                                  this.value = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getHorizontalSize(6),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: TextButton(
                                style:
                                TextButton.styleFrom(padding: EdgeInsets.zero),
                                onPressed: () {

                                },
                                child: Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                      text: Strings.i_agree,
                                      style: TextViews
                                          .txtLatoRegular12textSecondaryColor1.copyWith(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: Strings.terms_conditions,
                                      style: TextViews.txtLato12Primary.copyWith(color: Colors.red),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, heightScaled(context: context, pixels: 20), 0, 20),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: Strings.already_account,
                          style: TextViews
                              .txtLatoRegular12textSecondaryColor1.copyWith(color: Colors.black)
                        ),
                        TextSpan(
                            text: Strings.sign_in,
                            style: TextViews.txtLato12Primary.copyWith(color: Colors.red),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {Navigator.pushReplacement(
                                  context, rightToLeft(LoginScreen(), null));}
                        ),
                      ]),
                    ),
                  ],
                ),

              ),
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

                      onPressed: () async {
                        if (formValid){
                          sendOTP();
                        }
                        else{
                          validateForm();
                        }
                      },
                      child:  Text("Sign Up"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendOTP() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );
    setState(() {
      isLoading = true;

    });

    final PhoneCodeSent codeSent = (String verificationId, [int? forceResendingToken]) {
      setState(() {
        isLoading = false;
        this.verificationId = verificationId;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("OTP Sent!"),

      ));
      Navigator.of(context).push(bottomToTop(OtpScreen(phoneNumber: number!, password: password!, UserName: name!,verificationId :  this.verificationId)));

    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
      setState(() {
        isLoading = false;
        this.verificationId = verificationId;
      });
    };

    final PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Verification Failed: ${authException.message}"),
      ));
    };

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: number!,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error sending OTP: $e"),
      ));
    }
  }
  final PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) {
    // This function can remain empty or perform any necessary actions upon verification.
  };
}

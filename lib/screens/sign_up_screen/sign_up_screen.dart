import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  String? phoneNumber;
  String? otp;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Verification")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ),
          ],
        ),
      ),
    );
  }

  final PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential phoneAuthCredential) {
    // This function can remain empty or perform any necessary actions upon verification.
  };


  Future<void> sendOTP() async {
    setState(() {
      isLoading = true;
    });

    final PhoneCodeSent codeSent = (String verificationId, [int? forceResendingToken]) {
      setState(() {
        isLoading = false;
        this.verificationId = verificationId;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("OTP Sent!"),
      ));
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
        phoneNumber: phoneNumber!,
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


  Future<void> verifyOTP() async {
    setState(() {
      isLoading = true;
    });

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp!,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user != null) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("OTP Verified!"),
        ));
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
}

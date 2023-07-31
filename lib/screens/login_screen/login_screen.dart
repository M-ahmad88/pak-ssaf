
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pak_saaf/screens/main_bottom_nav/main_home_screen.dart';
import '../../common/button_widget.dart';
import '../../common/checkbox_widget.dart';
import '../../common/custom_animation.dart';
import '../../common/input_text_field_widget.dart';
import '../../common/password_field_widget.dart';
import '../../common/scaffold_app_bar.dart';
import '../../forgot_password_screen.dart';
import '../../utils/view_constants.dart';
import '../sign_up_screen/sign_up_screen.dart';

import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/icon_constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  bool shouldRemember = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isButtonEnabled = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

              ButtonWidgets.outlinedButton(

                text: Strings.sign_in,
                edgeInsets: EdgeInsets.fromLTRB(
                    0, heightScaled(context: context, pixels: 32), 0, 0),
                voidCallback: () {
                  Navigator.of(context).push(bottomToTop(MainHomeScreen()));


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
                                .txtLatoRegular12textSecondaryColor1,
                          ),
                          TextSpan(
                              text: Strings.sign_up,
                              style: TextViews.txtLato12Primary,
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
  }

}
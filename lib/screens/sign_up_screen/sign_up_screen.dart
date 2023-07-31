import 'dart:collection';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:http/http.dart';

import '../../common/custom_animation.dart';
import '../../common/custom_button.dart';
import '../../common/drop_down_widget.dart';
import '../../common/input_text_field_widget.dart';
import '../../common/password_field_widget.dart';
import '../../common/scaffold_app_bar.dart';
import '../../string_en.dart';
import '../../themes/text_styles.dart';
import '../../utils/color_constants.dart';
import '../../utils/size_utils.dart';
import '../../utils/view_constants.dart';
import '../login_screen/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);





  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool value = false;
  String? password;
  String? confirmPassword;
  String? countryCode;
  bool isLoading = false;
  bool isTermsAndConditionChecked = false;

  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    return Scaffold(
      appBar: scaffoldAppBar(context, Strings.sign_up),
      bottomNavigationBar: isLoading
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
            ViewConstants.bottomSheetButtonWidget(txtButton:  Strings.sign_up,variant: ButtonVariant.FillprimaryColor, onButtonPressed: () async {

            }

                )

        ,
          ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ViewConstants.scaledPagePadding(context: context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InputTextWidget(
                isMandatory: true,
                paddingTop: getVerticalSize(16),
                label: Strings.full_name,
                hint: Strings.full_name,
                onTextChange: (text) {


                },
              ),

              InputTextWidget(
                paddingTop: getVerticalSize(16),
                isMandatory: true,
                label: Strings.email,
                hint: Strings.enter_email,
                onTextChange: (text) {

                },
              ),
              InputTextWidget(
                paddingTop: getVerticalSize(16),
                isMandatory: true,
                label: Strings.username,
                hint: Strings.enter_username,
                onTextChange: (text) {

                },
              ),
              TextViews.textContainer(text: Strings.username_requirement, textSize: 12, edgeInsets: EdgeInsets.fromLTRB(5, 1, 0, 0)),
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
                                      .txtLatoRegular12textSecondaryColor1,
                                ),
                                TextSpan(
                                  text: Strings.terms_conditions,
                                  style: TextViews.txtLato12Primary,
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
                    0, heightScaled(context: context, pixels: 20), 0, 0),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: Strings.already_account,
                          style: TextViews
                              .txtLatoRegular12textSecondaryColor1,
                        ),
                        TextSpan(
                          text: Strings.sign_in,
                          style: TextViews.txtLato12Primary,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {Navigator.pushReplacement(
                                  context, rightToLeft(LoginScreen(), null));}
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

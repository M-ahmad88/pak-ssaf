
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:pak_saaf/string_en.dart';
import 'package:pak_saaf/utils/color_constants.dart';

import '../../styles/custom_app_bar.dart';
import '../../themes/text_styles.dart';
import '../../utils/size_utils.dart';
import '../../utils/text_constants.dart';
import '../../utils/view_constants.dart';
import '../common/button_widget.dart';
import '../common/input_text_field_widget.dart';
import '../common/toast_message.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(60),
          leadingWidth: 40,
          leading: Padding(
              padding: EdgeInsets.only(left: 18),
              child: ButtonWidgets.backRoundedButton(context)),
          centerTitle: true,
          title: Text(Strings.forgot_your_password,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextViews.txtLatoRegular18)),
      body: Padding(
        padding: getPadding(left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(
              height: heightScaled(context: context, pixels: 18),
            ),
            TextViews.textContainer(
              text: Strings.forgot_password_instruction,
              textSize: 14,
              textColor: ThemeColor.textWhiteColor
            ),
            InputTextWidget(
                textEditingController: emailController,
                label: Strings.email,
                hint: Strings.enter_email,
                onTextChange: (text) {}),
            SizedBox(
              height: getVerticalSize(40),
            ),
           ButtonWidgets.outlinedButton(
                    radius: 8,
                    text: Strings.send,
                    edgeInsets: EdgeInsets.zero,
                    voidCallback: () {
                    })
            ],
        ),
      ),
    );
  }
}

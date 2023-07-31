import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/text_styles.dart';
import '../utils/color_constants.dart';
import '../utils/view_constants.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final String hint;
  List<TextInputFormatter> inputFormatters;
  final bool isMandatory;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  final Function(String?) onTextChange;
  final TextInputAction textInputAction;
  double paddingTop = 30;
  double containerPadding = 5;
  bool showLabel = true;

  InputTextWidget(
      {Key? key,
      this.isMandatory = false,
      this.textInputAction = TextInputAction.next,
      required this.label,
      required this.hint,
      required this.onTextChange,
      this.textInputType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters,
      this.textEditingController,
      this.paddingTop=30,
      this.containerPadding = 8,
      this.showLabel = true})
      :inputFormatters = inputFormatters ?? [], super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showLabel? Padding(
          padding: EdgeInsets.only(
              left: heightScaled(context: context, pixels: 5),
              top: heightScaled(context: context, pixels: paddingTop)),
          child: Row(children: [
            TextViews.text_14(
              text: label,
            ),
            isMandatory
                ? TextViews.text_14(text: '*', textColor: ThemeColor.redAlert)
                : const SizedBox.shrink()
          ]),
        ):SizedBox.shrink(),
        Container(
          height: heightScaled(context: context, pixels: 50),
          margin: EdgeInsets.only(top: heightScaled(context: context, pixels: containerPadding)),
          child: TextFormField(
            inputFormatters: inputFormatters,
            validator: (value) {},
            controller: textEditingController,
            keyboardType: textInputType,
            onChanged: onTextChange,
            textInputAction: textInputAction,
            cursorColor: ThemeColor.textWhiteColor,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: EdgeInsets.fromLTRB(15,0,15,0),
                filled: true,
                hintStyle: const TextStyle(color: ThemeColor.textSecondaryColor01, fontSize: 14),
                hintText: hint,
                fillColor: ThemeColor.textFieldBackgroundColor),
            style: const TextStyle(color: ThemeColor.textWhiteColor, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
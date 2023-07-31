



import 'package:flutter/material.dart';

import '../../utils/color_constants.dart';
import '../../utils/view_constants.dart';

class TextInputMultiLineFieldWidget extends StatelessWidget {
  const TextInputMultiLineFieldWidget({Key? key,required this.hint, required this.maxLines, this.textInputType = TextInputType.text, this.textEditingController}) : super(key: key);
  final String hint;
  final int maxLines;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: heightScaled(context: context, pixels: 8)),
      child: TextField(
        maxLines: maxLines,
        controller: textEditingController,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        cursorColor: ThemeColor.textWhiteColor,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: const TextStyle(color: ThemeColor.textSecondaryColor),
            hintText: hint,
            fillColor: ThemeColor.textFieldBackgroundColor),
        style: const TextStyle(color: ThemeColor.textFieldInputColor_1),
      ),
    );
  }
}

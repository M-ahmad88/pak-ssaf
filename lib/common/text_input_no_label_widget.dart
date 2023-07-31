import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/color_constants.dart';
import '../utils/size_utils.dart';
class TextInputNoLabelWidget extends StatefulWidget {

  TextInputNoLabelWidget({Key? key, required this.textEditingController, required this.hint, this.isPasswordField=false, this.maxLines = 1}) : super(key: key);
  TextEditingController textEditingController;
  String hint;
  bool isPasswordField;
  int maxLines;
  @override
  State<TextInputNoLabelWidget> createState() => _TextInputNoLabelWidgetState();
}

class _TextInputNoLabelWidgetState extends State<TextInputNoLabelWidget> {
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 10),
      child: TextField(
        maxLines: widget.maxLines,
        autofocus: true,
        onSubmitted: (text) {},
        textInputAction: TextInputAction.next,
        obscureText: _isHidden && widget.isPasswordField,
        controller: widget.textEditingController,
        cursorColor: ThemeColor.textWhiteColor,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: const TextStyle(color: ThemeColor.textHintColor_1),
            hintText: widget.hint,
            suffixIcon: !widget.isPasswordField
                ? SizedBox.shrink()
            // IconButton(
            //   splashColor: Colors.transparent,
            //   highlightColor: Colors.transparent,
            //   icon: const Icon(Icons.remove_circle),
            //   onPressed: (){
            //     widget.textEditingController.text = '';
            //   },
            // )
                : IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                _isHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: () {
                _togglePasswordView();
              },
            ),
            suffixIconColor: ThemeColor.textSecondaryColor,
            fillColor: ThemeColor.textFieldBackgroundColor),
        style: const TextStyle(color: ThemeColor.textFieldInputColor_1),
      ),
    );
  }
}


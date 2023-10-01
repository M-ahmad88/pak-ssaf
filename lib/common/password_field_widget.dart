import 'package:flutter/material.dart';

import '../themes/text_styles.dart';
import '../utils/color_constants.dart';
import '../utils/view_constants.dart';

class PasswordFieldWidget extends StatefulWidget {
  final String label;
  final String hint;
  final bool isMandatory;
  final TextEditingController? textEditingController;
  final Function(String?) onTextChange;

  const PasswordFieldWidget(
      {Key? key,
      this.isMandatory = false,
      required this.label,
      required this.hint,
      required this.onTextChange,
      this.textEditingController})
      : super(key: key);

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _isHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: heightScaled(context: context, pixels: 5),
              top: heightScaled(context: context, pixels: 16)),
          child: Row(children: [
            TextViews.text_14(
              text: widget.label,
            ),
            widget.isMandatory
                ? TextViews.text_14(text: '*', textColor: ThemeColor.redAlert)
                : const SizedBox.shrink()
          ]),
        ),
        Container(
          height: heightScaled(context: context, pixels: 70),
          margin:
              EdgeInsets.only(top: heightScaled(context: context, pixels: 5)),
          child: Container(
            margin: const EdgeInsets.only(top: 8),
            child: TextFormField(
              controller: widget.textEditingController,
              cursorColor: ThemeColor.textWhiteColor,
              obscureText: _isHidden,
              onChanged: widget.onTextChange,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(15,0,15,0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: const TextStyle(color: ThemeColor.textSecondaryColor01, fontSize: 14),
                  hintText: widget.hint,
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      _isHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _togglePasswordView();
                    },
                  ),
                  suffixIconColor: ThemeColor.textSecondaryColor,
                  fillColor: ThemeColor.textFieldBackgroundColor),
              style: const TextStyle(color: ThemeColor.textWhiteColor, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

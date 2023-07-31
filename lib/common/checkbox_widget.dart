import 'package:flutter/material.dart';

import '../utils/color_constants.dart';
import '../utils/view_constants.dart';

class CheckBoxWidget extends StatefulWidget {
  final String text;
  final Function(bool) shouldRemember;

  const CheckBoxWidget(
      {Key? key, required this.text, required this.shouldRemember})
      : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {


  bool value = false;

  @override
  void initState() {
    // _setRememberMeFromSharedPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          value = !value;
          widget.shouldRemember(value);
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: ThemeColor.textRippleGrey,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                value = !value;
                widget.shouldRemember(value);
              });
            },
            child: Container(
              height: heightScaled(context: context, pixels: 16),
              width: widthScaled(context: context, pixels: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: value
                      ? ThemeColor.primaryColor
                      : ThemeColor.textSecondaryColor,
                  border:
                      Border.all(width: 2, color: ThemeColor.textSecondaryColor)),
              child: Checkbox(
                checkColor: ThemeColor.secondaryColor,
                activeColor: ThemeColor.primaryColor,
                side: const BorderSide(width: 2, color: ThemeColor.textSecondaryColor),
                value: value,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                onChanged: (bool? value) {
                  setState(() {
                    this.value = value!;
                    widget.shouldRemember(value);
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: widthScaled(context: context, pixels: 9),
            ),
            child: Text(
              widget.text,
              style: const TextStyle(
                fontSize: 12,
                color: ThemeColor.textWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

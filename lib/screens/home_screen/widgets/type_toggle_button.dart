import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';


import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/icon_constants.dart';
import '../../../utils/size_utils.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

double width = getHorizontalSize(160);
double height = getVerticalSize(40);
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = ThemeColor.textHintColor_1;

class _ToggleButtonState extends State<ToggleButton> {
  late double xAlign;
  late Color audiosColor;
  late Color articlesColor;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColor.inActiveRadio,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),

        ),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(xAlign, 0),
            duration: Duration(milliseconds: 200),
            child: Container(
              width: width * 0.5,
              height: height,
              decoration: BoxDecoration(
                color: ThemeColor.selectedChipColor,
                border: Border.all(
                  color: ThemeColor.primaryColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {            },
            child: Align(
              alignment: Alignment(-1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text("Audios", style: TextViews.txtLatoSemiBold14White.copyWith(color: audiosColor),),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
            },
            child: Align(
              alignment: Alignment(1, 0),
              child: Container(
                width: width * 0.5,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(Strings.articles, style: TextViews.txtLatoSemiBold14White.copyWith(color: articlesColor),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
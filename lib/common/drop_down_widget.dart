import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

import '../string_en.dart';
import '../themes/text_styles.dart';
import '../utils/color_constants.dart';
import '../utils/view_constants.dart';

const List<String> titles = <String>['Mr.', 'Mrs.', 'Dr.'];

class DropDownWidget extends StatefulWidget {
  Function(String) onDropDownSelected;
  final bool isMandatory;

  DropDownWidget(
      {Key? key, this.isMandatory = false, required this.onDropDownSelected})
      : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = titles.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: heightScaled(context: context, pixels: 5),
              top: heightScaled(context: context, pixels: 30)),
          child: Row(children: [
            TextViews.text_14(
              text: Strings.title,
            ),
            widget.isMandatory
                ? TextViews.text_14(text: '*', textColor: ThemeColor.redAlert)
                : const SizedBox.shrink()
          ]),
        ),
        Container(
          margin: ViewConstants.scaledEdgeInsets(context: context, top: 8),
          child: DropdownButtonFormField(
            icon: const Icon(Icons.keyboard_arrow_down_rounded,
                color: ThemeColor.textWhiteColor),
            dropdownColor: ThemeColor.textFieldBackgroundColor,
            items: titles.map<DropdownMenuItem<String>>((String value) {
              widget.onDropDownSelected(value);
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: ThemeColor.textWhiteColor, fontSize: 16),
                ),
              );
            }).toList(),

            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: const TextStyle(color: ThemeColor.textHintColor_1, fontSize: 14),
                hintText: Strings.choose_title,
                fillColor: ThemeColor.textFieldBackgroundColor),
            onChanged: (String? value) {},
          ),
        ),
      ],
    );
  }
}

class LocationDropDown extends StatelessWidget {
  const LocationDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: heightScaled(context: context, pixels: 5),
              top: heightScaled(context: context, pixels: 30)),
          child: Row(children: [
            TextViews.text_14(
              text: Strings.location,
            ),
            TextViews.text_14(
                text: Strings.asterik, textColor: ThemeColor.redAlert)
          ]),
        ),
        InkWell(
          onTap: () {
          },
          child: Padding(
            padding:
            EdgeInsets.only(top: heightScaled(context: context, pixels: 8)),
            child: Container(
              height: heightScaled(context: context, pixels: 56),
              decoration: const BoxDecoration(
                color: ThemeColor.textFieldBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                        child: TextViews.textContainer(
                            text: Strings.london_uk,
                            textSize: 16,
                            textColor: ThemeColor.textFieldInputColor_1)),
                    const Icon(Icons.keyboard_arrow_down_rounded,
                        size: 24, color: ThemeColor.textWhiteColor)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownFieldWidget extends StatefulWidget {
  String label;
  bool isMandatory;
  String hint;
  String value;
  bool highlightColor=false;
  VoidCallback onPressed;
  bool isEnabled = false;
  bool isComingFromSignUp = false;

  DropDownFieldWidget({Key? key,
    required this.label,
    required this.isMandatory,
    required this.hint,
    required this.value,
    required this.onPressed,
    this.highlightColor = false,
    this.isEnabled = false,  bool isComingFromSignUp = true})
      : super(key: key);

  @override
  State<DropDownFieldWidget> createState() => _DropDownFieldWidgetState();
}

class _DropDownFieldWidgetState extends State<DropDownFieldWidget> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          EdgeInsets.only(left: heightScaled(context: context, pixels: 5)),
          child: Row(children: [
            Text(
              widget.label,
              style: TextViews.txtLatoRegular14White
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            widget.isMandatory
                ? TextViews.text_14(
                text: Strings.asterik, textColor: ThemeColor.redAlert)
                : SizedBox.shrink()
          ]),
        ),
        InkWell(
          onTap: widget.onPressed,
          child: Padding(
            padding:
            EdgeInsets.only(top: heightScaled(context: context, pixels: 8)),
            child: Container(
              height: heightScaled(context: context, pixels: 50),
              decoration: const BoxDecoration(
                color: ThemeColor.textFieldBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15,0,15,0),
                child: Row(
                  children: [
                    Expanded(

                        child: !widget.isComingFromSignUp ?
                        TextViews.textContainer(
                            text: widget.value,
                            textSize: 16,
                            textColor: widget.highlightColor? ThemeColor.textWhiteColor: ThemeColor.textSecondaryColor)
                            : TextViews.textContainer(
                            text: widget.value,
                            textSize: 16,
                            textColor: widget.isEnabled
                                ? ThemeColor.textWhiteColor
                                : ThemeColor.textSecondaryColor)),

                    Icon(Icons.keyboard_arrow_down_rounded,
                        size: 32,
                        color: widget.isEnabled || widget.isComingFromSignUp
                            ? ThemeColor.textWhiteColor
                            : ThemeColor.textSecondaryColor)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

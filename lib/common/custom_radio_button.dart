import 'package:flutter/material.dart';
import '../../utils/size_utils.dart';
import '../themes/text_styles.dart';
import '../utils/color_constants.dart';

class CustomRadioTile extends StatelessWidget {
  final String text;
  final String value;
  final String groupValue;
  final Function(String?) onChanged;

  CustomRadioTile({
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: ThemeColor.textFieldBackgroundColor,
      ),
      child: Padding(
        padding: getPadding(top: 2, bottom: 2),
        child: RadioListTile(
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(
            text,
            style: TextViews.txtLatoRegular14InputHintColor,
          ),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: ThemeColor.primaryColor,
          selectedTileColor: Colors.blue[100],
        ),
      ),
    );
  }
}

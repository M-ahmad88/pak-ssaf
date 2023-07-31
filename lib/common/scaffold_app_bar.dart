import 'package:flutter/material.dart';
import '../utils/color_constants.dart';

AppBar scaffoldAppBar(BuildContext context, String heading,
    [bool popUp = true]) {
  return AppBar(
      centerTitle: true,
      title: Text(heading,
          style:
              const TextStyle(fontSize: 18, color: ThemeColor.textWhiteColor)),
      backgroundColor: ThemeColor.secondaryColor,
      elevation: 0,
      leading: popUp ?  IconButton(
        onPressed: () {
          popUp ? Navigator.pop(context) : null;
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ) :
          const Icon(Icons.arrow_back_ios_new_rounded)
  );
}

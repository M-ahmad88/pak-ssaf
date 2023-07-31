import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:pak_saaf/screens/home_screen/widgets/top_home_bar.dart';
import '../../utils/internet_connectivity_checker.dart';
import '../../utils/size_utils.dart';
import '../../utils/tracking_events.dart';

import '../../../string_en.dart';
import '../../../themes/text_styles.dart';
import '../../../utils/color_constants.dart';
import '../../utils/view_constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool _searchBarActive = false;

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  bool _isEndReached() {
    final double maxScroll = _controller.position.maxScrollExtent;
    final double currentScroll = _controller.position.pixels;
    return currentScroll >= maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: getPadding(
              top: 60, bottom: 65 , right: 0, left: 0),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(left: 14, right: 14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      getTopHomeBar(context, () {  }),
                      SizedBox(
                          height: heightScaled(context: context, pixels: 12)),
                      //ToggleButton(),

                ],
              ),),],),
           ),
    );
  }


}

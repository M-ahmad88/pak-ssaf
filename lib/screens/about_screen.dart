import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color_constants.dart';


class AboutScreen extends StatefulWidget
{
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}




class _AboutScreenState extends State<AboutScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: ThemeColor.secondaryColor,
      appBar:  AppBar(
        title: const Text("Help"),
        foregroundColor:Colors.white ,
        backgroundColor:    ThemeColor.secondaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            const Text(
              "Pak Saaf",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 70,
            ),

            //about you & your company - write some info
            const Text(
              "This app has been developed as an FYP ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            const Text(
                  "RECYCLE, REUSE, REDUCE",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "To contact, email us at paksaaf@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              height: 40,
            ),



          ],
        ),
      ),
    );
  }
}

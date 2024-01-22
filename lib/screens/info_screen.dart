import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color_constants.dart';


class InfoScreen extends StatefulWidget
{
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}




class _InfoScreenState extends State<InfoScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: ThemeColor.secondaryColor,
      appBar:  AppBar(
        title: const Text("About Us"),
        foregroundColor:Colors.white ,
        backgroundColor:    ThemeColor.secondaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [


            Text(
              "Pak Saaf",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 50,
            ),

            //about you & your company - write some info
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "At Pak Saaf, we believe in the transformative power of small actions for a greater impact. Every piece of plastic, every bottle – they all have the potential to be reborn through the simple act of recycling. By using our app, you are not just embracing a sustainable lifestyle, but you are becoming a guardian of our planet's future. Together, let's turn waste into possibility, one recyclable at a time. Join us in the journey towards a cleaner, greener world, because the Earth deserves our care, and every recycled item is a step toward a brighter tomorrow.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}

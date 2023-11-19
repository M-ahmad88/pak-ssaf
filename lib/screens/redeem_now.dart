import 'package:flutter/material.dart';

import '../utils/color_constants.dart';

class RedeemScreen extends StatelessWidget {
  final List<String> cardTitles = [
    "Packet of Lays",
    "McFlurry",
    "Packet of Lays",
    "McFlurry",
    "Packet of Lays",
    "McFlurry",

  ];
  final List<String> cardSubtitles = [
    "10 pts",
    "20 pts",
    "10 pts",
    "20 pts",
    "10 pts",
    "20 pts",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.secondaryColor,
        title: Text("Redeem Now"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: cardTitles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Add your action when a card is clicked
              print("Card ${index + 1} clicked!");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // Adjust the value as needed
                ),
                elevation: 6.0,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cardTitles[index],
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 8.0), // Add spacing between title and subtitle
                  Text(
                    cardSubtitles[index],
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
              ),
            ),
          );
        },
      ),
    );
  }
}

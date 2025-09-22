import 'package:flutter/material.dart';

import 'custom_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2, // 2 cards in a row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.60,

            children: [CustomCard(), CustomCard(), CustomCard(), CustomCard()],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'custom_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2, // 2 cards in a row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.70,

              children: [
                CustomCard(
                  img: 'mern.png',
                  title: 'Full Stack Web \nDevelopment With JavaScipt(MERN)',
                  seat: '৬ সিট বাকি',
                  batch: 'ব্যাচ ১২',
                  day: '৬ দিন বাকি',
                ),
                CustomCard(
                  img: 'python.png',
                  title:
                      'Full Stack Web \nDevelopment With Python, Django & React',
                  seat: '৮৬ সিট বাকি',
                  batch: 'ব্যাচ ৬',
                  day: '৪০ দিন বাকি',
                ),
                CustomCard(
                  img: 'asp.png',
                  title: 'Full Stack Web \nDevelopment with ASP.Net Core',
                  seat: '৭৫ সিট বাকি',
                  batch: 'ব্যাচ ৭',
                  day: '৩৯ দিন বাকি',
                ),
                CustomCard(
                  img: 'sqa.png',
                  title: 'SQA: Manual & Automated Testing\n',
                  seat: '৬৫ সিট বাকি',
                  batch: 'ব্যাচ ১৩',
                  day: '৪১ দিন বাকি',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

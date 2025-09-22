import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://cdn.ostad.app/course/cover/2024-12-17T11-35-19.890Z-Course%20Thumbnail%2012.jpg',
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(0.1),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.20),
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'ব্যাচ ১২',
                            style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: EdgeInsets.all(0.1),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.20),
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.chair_rounded, size: 10),
                          SizedBox(width: 2),
                          Text(
                            '৪ সিট খালি',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: EdgeInsets.all(0.1),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.20),
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 10),
                          SizedBox(width: 2),
                          Text(
                            '৫ দিন বাকি',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),

            Text(
              'Full Stack Web Development With JavaScipt',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(4),
                backgroundColor: Colors.white.withOpacity(0.30),

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              child: Text('বিস্তারিত দেখি →'),
            ),
          ],
        ),
      ),
    );
  }
}

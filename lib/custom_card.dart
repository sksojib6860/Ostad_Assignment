import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String img, title, seat, batch, day;
  const CustomCard({
    super.key,
    required this.img,
    required this.title,
    required this.seat,
    required this.batch,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(img),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 3,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.20),
                      ),
                      child: Row(
                        children: [
                          Text(batch, style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),

                    SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.20),
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.chair_rounded,
                            color: Colors.black54,
                            size: 10,
                          ),
                          SizedBox(width: 2),
                          Text(seat, style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 10),
                          SizedBox(width: 2),
                          Text(day, style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                backgroundColor: Colors.white.withOpacity(0.30),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'বিস্তারিত দেখি →',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

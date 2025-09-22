import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Module 13 Assignment',
      home: Scaffold(
        appBar: AppBar(title: Text('Course Offerings')),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 2, // 2 cards in a row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
            children: [
              CourseCard(
                title: 'Full Stack Web Development with JavaScript (MERN)',
                description: 'Learn MongoDB, Express.js, React, and Node.js.',
              ),
              CourseCard(
                title: 'Full Stack Web Development with Python, Django & React',
                description: 'Build full stack apps using Django and React.',
              ),
              CourseCard(
                title: 'Full Stack Web Development with ASP.Net Core',
                description: 'Master ASP.Net Core for enterprise-grade apps.',
              ),
              CourseCard(
                title: 'SQA: Manual & Automated Testing',
                description: 'Explore software testing techniques and tools.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String description;

  CourseCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.school, size: 40, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text('বিস্তারিত দেখুন')),
                ElevatedButton(onPressed: () {}, child: Text('ভর্তি হন')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

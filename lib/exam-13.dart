import 'package:flutter/material.dart';

class ContactApp extends StatefulWidget {
  const ContactApp({super.key});

  @override
  State<ContactApp> createState() => _ContactAppState();
}

class _ContactAppState extends State<ContactApp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  void addContact() {}

  final List<Map<String, dynamic>> contacts = [
    {'name': 'Ramu sign', 'phone': '017XXXXXXXX'},
    {'name': 'Kesob Sing', 'phone': '017XXXXXXXX'},
    {'name': 'Raghu protab sing', 'phone': '017XXXXXXXX'},
    {'name': 'Bensons protab sing', 'phone': '017XXXXXXXX'},
    {'name': 'John', 'phone': '018XXXXXXXX'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact App'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              cursorColor: Colors.grey,
              style: TextStyle(color: Colors.red),

              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 11,
              cursorColor: Colors.grey,
              style: TextStyle(color: Colors.red),

              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text.trim();
                String phone = phoneController.text.trim();

                if (name.isNotEmpty && phone.isNotEmpty) {
                  setState(() {
                    contacts.add({"name": name, "phone": phone});
                  });
                  nameController.clear();
                  phoneController.clear();
                }
              },

              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 215, vertical: 15),
                backgroundColor: Colors.red,
              ),

              child: Text('Add', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 15),
            Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(contacts[index]['name']),
                            subtitle: Text(contacts[index]['phone']),
                            leading: Icon(Icons.account_circle),
                            trailing: Icon(Icons.call, color: Colors.green),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

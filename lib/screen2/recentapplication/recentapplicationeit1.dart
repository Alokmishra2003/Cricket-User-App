import 'package:flutter/material.dart';

class RecentApplicationEdit1 extends StatelessWidget {
  final List<Map<String, String>> users = [
    {
      'name': 'User One',
      'batch': 'Batch One',
      'date': '24th August, 2024',
      'email': 'email1@example.com',
      'phone': '+91 234 567 890',
    },
    {
      'name': 'User Two',
      'batch': 'Batch Two',
      'date': '25th August, 2024',
      'email': 'email2@example.com',
      'phone': '+91 345 678 901',
    },
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Back navigation
          },
        ),
        title: Center(
          child: Text(
            'Recent Application',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: users.map((user) => UserContainer(user: user, screenWidth: screenWidth)).toList(),
          ),
        ),
      ),
    );
  }
}

class UserContainer extends StatelessWidget {
  final Map<String, String> user;
  final double screenWidth;

  UserContainer({required this.user, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.9,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.more_vert, size: 24.0),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user['name'] ?? 'Name Here',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    user['batch'] ?? 'Batch Text',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date of Registration',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                user['date'] ?? 'Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10), // Slightly circular corners
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['email'] ?? 'email@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                SizedBox(height: 10),
                Text(
                  user['phone'] ?? '+91 234 567 890',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB3E5FC), // Ultra-light blue color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Circular border
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(screenWidth * 0.4, 0), // 40% screen width
                ),
                child: Text(
                  'View',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1F74EC), // Color code for the Approve button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Circular border
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(screenWidth * 0.4, 0), // 40% screen width
                ),
                child: Text(
                  'Approve',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

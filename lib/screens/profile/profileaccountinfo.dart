import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String weight;
  final String dob;
  final String height;

  ProfileScreen({
    required this.name,
    required this.weight,
    required this.dob,
    required this.height,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _weightController;
  late TextEditingController _dobController;
  late TextEditingController _heightController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _weightController = TextEditingController(text: widget.weight);
    _dobController = TextEditingController(text: widget.dob);
    _heightController = TextEditingController(text: widget.height);
  }

  void _saveProfile() {
    // Implement the save functionality here
    // For now, we'll just print the values to the console
    print("Name: ${_nameController.text}");
    print("Weight: ${_weightController.text}");
    print("Date of Birth: ${_dobController.text}");
    print("Email: ${_heightController.text}");
    
    Navigator.pop(context, {
      'name': _nameController.text,
      'weight': _weightController.text,
      'dob': _dobController.text,
      'email': _heightController.text,
    });
  }

  String _getInitials(String name) {
    final names = name.split(' ');
    return names.map((n) => n[0]).take(2).join().toUpperCase(); // Get initials from both first and last name
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            Text(
              'Account Information',
              style: TextStyle(color: Colors.black),
            ),
            Spacer(),
            GestureDetector(
              onTap: _saveProfile,
              child: Text(
                'Save',
                style: TextStyle(color: Colors.purple, fontSize: 16),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                ),
                child: Text(
                  _getInitials(_nameController.text),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildProfileField("Name", _nameController),
            _buildProfileField("Weight", _weightController),
            _buildProfileField("Date of Birth", _dobController),
            _buildProfileField("Height", _heightController),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:coachui/screens/profile/profileaccountinfo.dart';
import 'package:coachui/screens/onboardingpages/onboarding.dart'; // Import your onboarding page
import 'package:coachui/screens/batchpages/batchcurrent.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "John Doe";
  String weight = "70 kg";
  String dob = "01/01/1990";
  String height = "175 cm";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7850BF), Color(0xFF512DA8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                icon: Icon(Icons.whatshot, color: Colors.redAccent),
                label: Text(
                  'U-13',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Handle button press
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_image.png'),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            _getInitials(name), // Display initials here
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ContainerWidget(
                  imagePath: 'assets/u5.png',
                  labelText: 'Weight ',
                ),
                ContainerWidget(
                  imagePath: 'assets/u6.png',
                  labelText: 'Height',
                ),
                ContainerWidget(
                  imagePath: 'assets/u7.png',
                  labelText: 'Birthday',
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF7850BF), Color(0xFF512DA8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  final updatedData = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        name: name,
                        weight: weight,
                        dob: dob,
                        height: height,
                      ),
                    ),
                  );

                  if (updatedData != null) {
                    setState(() {
                      name = updatedData['name'];
                      weight = updatedData['weight'];
                      dob = updatedData['dob'];
                      height = updatedData['email'];
                    });
                  }
                },
                child: Text(
                  'Edit Account Details',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            ContainerOption(
              text: 'Batch',
              icon: Icons.arrow_forward_ios,
              onTap: () {
                // Specify your navigation page here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBatchPage(), // Replace BatchPage with the desired page
                  ),
                );
              },
            ),
            ContainerOption(
              text: 'My Fees',
              icon: Icons.arrow_forward_ios,
            ),
            ContainerOption(
              text: 'Workout Reminder',
              icon: Icons.arrow_forward_ios,
            ),
            ContainerOption(
              text: 'Log Out',
              icon: null,
              onTap: _showLogoutDialog, // Add onTap callback
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final names = name.split(' ');
    return names.map((n) => n[0]).take(2).join().toUpperCase(); // Get initials
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Do you want to quit?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => OnboardingPage()), // Navigate to Onboarding page
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String imagePath;
  final String labelText;

  ContainerWidget({required this.imagePath, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            SizedBox(height: 5),
            Text(
              labelText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerOption extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool? switchWidget;
  final bool? switchValue;
  final Function(bool)? onSwitchChanged;
  final Function()? onTap; // Add onTap callback

  ContainerOption({
    required this.text,
    this.icon,
    this.switchWidget,
    this.switchValue,
    this.onSwitchChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the onTap callback
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (switchWidget != null && switchWidget!)
              Switch(
                value: switchValue ?? false,
                onChanged: onSwitchChanged,
              ),
            if (icon != null && !(switchWidget ?? false))
              Icon(
                icon,
                color: Colors.grey,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

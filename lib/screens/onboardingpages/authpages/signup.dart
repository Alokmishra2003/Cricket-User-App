import 'package:flutter/material.dart';
import 'package:coachui/screens/onboardingpages/authpages/otp.dart';
import 'package:coachui/screens/onboardingpages/authpages/signin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool? _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Repeated input container code can be refactored into a method
              _buildInputField(screenWidth, 'Full Name'),
              const SizedBox(height: 10),
              _buildInputField(screenWidth, 'Email'),
              const SizedBox(height: 10),
              _buildInputField(screenWidth, 'Phone'),
              const SizedBox(height: 10),
             // _buildInputField(screenWidth, 'Password', obscureText: true),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: _agreeToTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _agreeToTerms = value;
                        });
                      },
                    ),
                    const Text('I agree to the terms and conditions'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Updated ElevatedButton with LinearGradient
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF7850BF), // Start color of the gradient
                      Color(0xFF512DA8), // End color of the gradient
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: _agreeToTerms == true // Only enabled if terms are agreed
                      ? () {
                          // Navigate to OTPPage from SignUpPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OTPPage(fromSignIn: false)),
                          );
                        }
                      : null, // Disable button if terms are not agreed
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, // Set primary color to transparent
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Match the button border radius
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build input fields to avoid repetition
  Widget _buildInputField(double screenWidth, String hintText, {bool obscureText = false}) {
    return Container(
      width: screenWidth * 0.8,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:coachui/screens/onboardingpages/authpages/otp.dart';
import 'package:coachui/screens/onboardingpages/authpages/signup.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  Widget _buildInputContainer(Widget child) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            _buildInputContainer(
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Phone/Email',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildInputContainer(
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
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
                onPressed: () {
                  // Navigate to OTPPage from SignInPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTPPage(fromSignIn: true)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, // Set primary color to transparent
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Match the button border radius
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Forgot your password?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 72.0),
              child: Row(
                children: [
                  const Text(
                    'Have an account? ',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF7850BF), // Updated color for "Sign Up"
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

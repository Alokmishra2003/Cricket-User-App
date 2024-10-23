import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
//import 'package:coachui/screens/homepage/dashboard.dart';
import 'package:coachui/features/bottomnavigationbar/bottomnavigation.dart';
import 'package:coachui/screens/onboardingpages/authpages/registerpage/registerpage1.dart';

class OTPPage extends StatelessWidget {
  final bool fromSignIn; // Determines if the user came from SignInPage or SignUpPage

  const OTPPage({Key? key, required this.fromSignIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Phone Verification',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'We sent a code to your number',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  onChanged: (value) {},
                  onCompleted: (value) {
                    // Check if the user came from SignIn or SignUp
                    if (fromSignIn) {
                      // Navigate to DashboardScreen after OTP validation from SignIn
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Navigation()),
                      );
                    } else {
                      // Navigate to RegistrationPage after OTP validation from SignUp
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationPage()),
                      );
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    inactiveFillColor: Colors.grey[200],
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  textStyle: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  enablePinAutofill: true,
                  autoFocus: true,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 52.0),
                child: Row(
                  children: const [
                    Text(
                      'Not received the code?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Resend',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

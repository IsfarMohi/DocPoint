import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyOtp extends StatelessWidget {
  const MyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/OTP.jpg', // Ensure the image is in assets folder
            fit: BoxFit.cover,
          ),
          // Centered content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // OTP label
                const Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // OTP input field
                const OTPInput(),
                const SizedBox(height: 30),
                // Confirm OTP button
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.black,
                  child: IconButton(
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      // Navigate to the appointment page
                      Navigator.pushNamed(context, 'home');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      keyboardType: TextInputType.number,
      defaultPinTheme: PinTheme(
        width: 50,
        height: 60,
        textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueAccent, width: 2),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 50,
        height: 60,
        textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 2.5),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 50,
        height: 60,
        textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green, width: 2),
        ),
      ),
      showCursor: true,
    );
  }
}

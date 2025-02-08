import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(
              'assets/OTP.jpg',  // Make sure to add your background image in the assets folder
              fit: BoxFit.cover,
            ),
            // Centered content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // OTP label
                  Text(
                    'OTP',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // OTP input
                  const OTPInput(),
                  const SizedBox(height: 30),
                  // Confirm OTP button (circular)
                  GestureDetector(
                    onTap: () {
                      // Handle OTP confirmation
                      print("OTP confirmed");
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30,
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

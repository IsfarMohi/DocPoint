import 'package:flutter/material.dart';
import 'routes/loginPage/login.dart';
import 'routes/loginPage/otp.dart';
import 'routes/HomePage/AppointmentPage.dart';
import 'routes/ReportHistory/reports.dart';
import 'routes/HomePage/home.dart';
import 'routes/PaymentPage/payment.dart';

// Set this to true when debugging a specific page
const bool debugMode = true;
// Change this to the page you want to debug
const String debugPage = 'home';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: debugMode ? _getDebugPage() : const MyLogin(),
    routes: {
      'otp': (context) => const MyOtp(),
      'login': (context) => const MyLogin(),
      'appointment': (context) => const AppointmentPage(),
      'reports': (context) => const HospitalReportsPage(),
      'home': (context) => const HospitalLandingPage(),
      'payment': (context) => const PaymentPage(),
    },
  ));
}

Widget _getDebugPage() {
  switch (debugPage) {
    case 'login':
      return const MyLogin();
    case 'otp':
      return const MyOtp();
    case 'appointment':
      return const AppointmentPage();
    case 'reports':
      return const HospitalReportsPage();
    case 'home':
      return const HospitalLandingPage();
    case 'payment':
      return const PaymentPage();
    default:
      return const MyLogin();
  }
}




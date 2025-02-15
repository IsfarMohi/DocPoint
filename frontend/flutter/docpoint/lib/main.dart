import 'package:flutter/material.dart';
import 'package:loginuicolors/routes/loginPage/login.dart';
import 'package:loginuicolors/routes/loginPage/otp.dart';
import 'package:loginuicolors/routes/HomePage/AppointmentPage.dart';
import 'package:loginuicolors/routes/ReportHistory/reports.dart';
import 'package:loginuicolors/routes/HomePage/home.dart';





void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    routes: {
      'otp': (context) => const MyOtp(),
      'login': (context) => const MyLogin(),
      'appointment': (context) => AppointmentPage(),
      'reports': (context) => const HospitalReportsPage(),
      'home': (context) => const HospitalLandingPage(),
    },
  ));
}




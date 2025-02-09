import 'package:flutter/material.dart';
import 'package:loginuicolors/routes/login.dart';
import 'package:loginuicolors/routes/otp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    routes: {
      'otp': (context) => const Myotp(),
      'login': (context) => const MyLogin(),
    },
  ));
}




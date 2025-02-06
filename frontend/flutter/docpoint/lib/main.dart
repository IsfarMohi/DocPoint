import 'package:flutter/material.dart';
import 'dart:convert'; // For jsonEncode
import 'package:http/http.dart' as http; // For HTTP requests

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserFormPage(),
    );
  }
}

class UserFormPage extends StatefulWidget {
  const UserFormPage({super.key});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _usernameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String mobileNumber = _mobileController.text;

      try {
        // Backend API endpoint
        var url = Uri.parse("http://192.168.1.6:5000/save_user");
        
        // Send POST request
        var response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": username,
            "mobile": mobileNumber,
          }),
        );

        if (response.statusCode == 200) {
          // Success response
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Success'),
              content: Text('Data saved successfully: $username, $mobileNumber'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          // Error response
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to save data: ${response.body}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        // Handle network or other errors
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $e'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Form Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _mobileController,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  // Method for sending mobile number (signup)
  Future<bool> sendMobileNumber(String mobileNumber) async {
    try {
      var url = Uri.parse('$baseUrl/signup'); // Ensure correct endpoint
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"mobile": mobileNumber}),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      return response.statusCode == 200; // Returns true if successful
    } catch (e) {
      print("Request Error (Signup): $e");
      return false;
    }
  }

  // Method for creating an appointment
  Future<bool> createAppointment({
    required String branch,
    required String specialization,
    required String date,
    required String time,
  }) async {
    var url = Uri.parse('$baseUrl/appointments');
    var headers = {"Content-Type": "application/json"};

    var body = jsonEncode({
      'branch': branch,
      'specialization': specialization,
      'date': date,
      'time': time,
      'status': 'booked', // Default status when booking an appointment
    });

    print("Sending request to: $url");
    print("Request Body: $body");

    try {
      var response = await http.post(url, headers: headers, body: body);

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 201) {
        return true; // Appointment successfully booked
      } else {
        print("API Error: ${response.body}"); // Logs API error message
        return false;
      }
    } catch (e) {
      print("Request Error (Create Appointment): $e");
      return false;
    }
  }
}

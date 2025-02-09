// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<bool> sendMobileNumber(String mobileNumber) async {
    try {
      var url = Uri.parse('$baseUrl/save_user');
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"mobile": mobileNumber}),
      );

      if (response.statusCode == 200) {
        return true; // Success
      } else {
        print('Error: ${response.body}');
        return false; // Failure
      }
    } catch (e) {
      print('Error occurred: $e');
      return false; // Failure
    }
  }
}

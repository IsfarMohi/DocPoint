import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../base.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Razorpay _razorpay;
  String backendUrl = "http://192.168.0.11:5000"; // Change to your backend URL

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear(); // Clean up the instance
    super.dispose();
  }

  Future<void> createOrder() async {
    try {
      var response = await http.post(
        Uri.parse('$backendUrl/create-order'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"amount": 399}),
      );

      if (response.statusCode == 200) {
        var orderData = jsonDecode(response.body);
        openRazorpay(orderData);
      } else {
        throw Exception("Failed to create order");
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error creating order: $e")),
      );
    }
  }

  void openRazorpay(dynamic orderData) {
    var options = {
      'key': 'rzp_test_j31AGvFFIZU2r5', // Your Razorpay Key ID
      'amount': orderData['amount'],
      'order_id': orderData['id'],
      'name': 'Hospital Payment',
      'description': 'Payment for appointment',
      'prefill': {
        'contact': '9876543210',
        'email': 'user@example.com',
      },
      'theme': {
        'color': '#123456'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    var verifyResponse = await http.post(
      Uri.parse('$backendUrl/verify-payment'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'razorpay_order_id': response.orderId,
        'razorpay_payment_id': response.paymentId,
        'razorpay_signature': response.signature
      }),
    );

    if (verifyResponse.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment Verified Successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Payment Verification Failed!")),
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed: ${response.message}")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("External Wallet Selected: ${response.walletName}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Payment",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Appointment Summary
            const Text(
              "Appointment Summary",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            buildInfoCard([
              buildDetailRow("Doctor:", "Dr. John Doe"),
              buildDetailRow("Specialization:", "Cardiologist"),
              const Divider(), // A divider for better separation
              buildDetailRow("Consultation Fee:", "100"),
              buildDetailRow("Treatment Charges:", "150"),
              buildDetailRow("Medical Tests:", "80"),
              buildDetailRow("Other Fees:", "50"),
            ]),

            const SizedBox(height: 20),

            // Total Charges
            const Text(
              "Total Charges",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            buildInfoCard([
              buildDetailRow("Subtotal:", "380"),
              buildDetailRow("Tax (5%):", "19"),
              buildDetailRow("Total Amount Due:", "399"),
            ]),

            const SizedBox(height: 20),

            // Proceed to Payment Button
            Center(
              child: ElevatedButton(
                onPressed: createOrder, // Start the payment process
                child: const Text("Proceed to Payment", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Color.fromARGB(255, 123, 113, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.teal.withOpacity(0.4),
                  elevation: 10,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavItems: defaultBottomNavItems,
      onBottomNavTap: (index) {
        if (index == 1) {
          navigateToPage(context, 'appointment');
        } else if (index == 2) {
          navigateToPage(context, 'reports');
        } else {
          navigateToPage(context, 'home');
        }
      },
    );
  }

  // Reusable function to create a card
  Widget buildInfoCard(List<Widget> children) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  // Helper function to build label-value rows with better styling
  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

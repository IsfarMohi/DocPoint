import 'package:flutter/material.dart';

void main() {
  runApp(const HospitalApp());
}

class HospitalApp extends StatelessWidget {
  const HospitalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaymentPage(),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Colors.tealAccent,
              ],
              begin: Alignment.centerLeft, // Left-to-right gradient
              end: Alignment.centerRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Transparent for gradient
            elevation: 5,
            centerTitle: true,
            title: const Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/logo1.png'), // Replace with logo
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  // Implement hamburger menu functionality
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200], // Light gray background for a modern look
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
              buildDetailRow("Consultation Fee:", "\$100"),
              buildDetailRow("Treatment Charges:", "\$150"),
              buildDetailRow("Medical Tests:", "\$80"),
              buildDetailRow("Other Fees:", "\$50"),
            ]),

            const SizedBox(height: 20),

            // Total Charges
            const Text(
              "Total Charges",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            buildInfoCard([
              buildDetailRow("Subtotal:", "\$380"),
              buildDetailRow("Tax (5%):", "\$19"),
              buildDetailRow("Total Amount Due:", "\$399"),
            ]),

            const SizedBox(height: 20),

            // Proceed to Payment Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle payment confirmation
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Payment Confirmed"),
                      content: const Text("Your payment of \$399 has been successfully processed."),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Proceed to Payment", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 123, 113, 240), // Button color
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
            // Gradient Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,
              Colors.tealAccent,
            ],
            begin: Alignment.centerLeft, // Left-to-right gradient
            end: Alignment.centerRight,
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Transparent for gradient
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), // Hospital-related icon
              label: 'Reports',
            ),
          ],
          onTap: (index) {
            if (index == 1) {
              Navigator.pushNamed(context, 'appointment');
            } else if (index == 2) {
              Navigator.pushNamed(context, 'reports');
            } else {
              Navigator.pushNamed(context, 'home');
            }
          },
        ),
      )
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

import 'package:flutter/material.dart';
import '../../services/api_service.dart'; 


class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int selectedDateIndex = 0;
  int selectedTimeIndex = -1;
  String? selectedBranch;
  String? selectedSpecialization;

  final List<String> dates = [
    'Sa 08',
    'Su 09',
    'Mo 10',
    'Tu 11',
    'We 12',
    'Th 13'
  ];
  final List<String> times = [
    '10:00 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '05:00 PM'
  ];

  final Map<String, List<String>> branchSpecializations = {
    "Tolichowki": ["Cardiology", "Neurology", "Orthopedics"],
    "Tarnaka": ["Dermatology", "Pediatrics"],
    "Chatabazar": ["Oncology", "Radiology"],
    "Wadi Huda": ["Gynecology", "ENT", "General Surgery"],
  };

   // Method to handle the booking process
  Future<void> _bookAppointment() async {
    if (selectedDateIndex != -1 && selectedTimeIndex != -1 && selectedBranch != null && selectedSpecialization != null) {

      // Call your ApiService to create the appointment
      bool success = await ApiService(baseUrl: 'http://192.168.0.10:5000').createAppointment(
        branch: selectedBranch!,
        specialization: selectedSpecialization!,
        date: dates[selectedDateIndex],
        time: times[selectedTimeIndex],
      );

      // Show success or failure message
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Appointment booked successfully!')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to book appointment!')));
      }
    } else {
      print("Missing selections");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please complete all selections.')));
    }
  }

  List<String> getSpecializations() {
    return selectedBranch != null
        ? branchSpecializations[selectedBranch!]!
        : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              "Book Appointment",
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Branch Dropdown
            const Text('Select Hospital Branch',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            
            DropdownButtonFormField<String>(
              value: selectedBranch,
              hint: const Text("Choose a branch"),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              isExpanded: true,
              items: branchSpecializations.keys.map((branch) {
                return DropdownMenuItem<String>(
                  value: branch,
                  child: Row( // Only use Row here for the list
                    children: [
                      const Icon(Icons.local_hospital_rounded, color: Colors.teal, size: 20),
                      const SizedBox(width: 10),
                      Text(
                        branch,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBranch = value;
                  selectedSpecialization = null; // Reset specialization
                });
              },
            ),
            const SizedBox(height: 20),

            // Specialization Dropdown
            const Text('Select Specialization',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedSpecialization,
              hint: const Text("Choose specialization"),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              isExpanded: true,
              items: getSpecializations().map((specialization) {
                return DropdownMenuItem<String>(
                  value: specialization,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          Colors.teal.withOpacity(0.1), // Light teal background
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.health_and_safety,
                            color: Colors.teal, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          specialization,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: selectedBranch == null
                  ? null
                  : (value) {
                      setState(() {
                        selectedSpecialization = value;
                      });
                    },
            ),
            const SizedBox(height: 20),

            // Date selection
            const Text('Select Date',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 70,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: selectedDateIndex == index
                            ? const Color(0xff13a8b4)
                            : const Color.fromARGB(255, 243, 243, 243),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          dates[index],
                          style: TextStyle(
                            color: selectedDateIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Time selection
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: times.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTimeIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: selectedTimeIndex == index
                            ? const Color(0xff13a8b4)
                            : const Color.fromARGB(255, 242, 242, 242),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          times[index],
                          style: TextStyle(
                            color: selectedTimeIndex == index
                                ? Colors.white
                                : const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                   _bookAppointment();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff13a8b4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('Confirm Appointment',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
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
      ),
    );
  }
}

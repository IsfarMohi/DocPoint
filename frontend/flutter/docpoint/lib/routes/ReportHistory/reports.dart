import 'package:flutter/material.dart';

// Define theme colors for easy customization
const Color primaryColor = Color.fromARGB(255, 9, 222, 255);
const Color accentColor = Colors.teal;
const Color completedStatusColor = Colors.green;

class HospitalReportsPage extends StatelessWidget {
  const HospitalReportsPage({super.key});

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
              "Reports",
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
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search reports...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Filter Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: true,
                  onSelected: (bool value) {},
                  selectedColor: accentColor,
                  checkmarkColor: Colors.white,
                ),
                FilterChip(
                  label: const Text('Completed'),
                  selected: false,
                  onSelected: (bool value) {},
                ),
                FilterChip(
                  label: const Text('Pending'),
                  selected: false,
                  onSelected: (bool value) {},
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Reports List
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example count
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Report #${index + 1}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Patient: John Doe',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Status: Completed',
                            style: TextStyle(
                              color: completedStatusColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('View Details'),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Download'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primaryColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        bodyMedium: TextStyle(fontSize: 14),
      ),
    ),
    home: const HospitalReportsPage(),
  ));
}

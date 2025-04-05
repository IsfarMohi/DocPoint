import 'package:flutter/material.dart';
import '../base.dart';

// Define theme colors for easy customization
const Color primaryColor = Color.fromARGB(255, 9, 222, 255);
const Color accentColor = Colors.teal;
const Color completedStatusColor = Colors.green;

class HospitalReportsPage extends StatelessWidget {
  const HospitalReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Reports",
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

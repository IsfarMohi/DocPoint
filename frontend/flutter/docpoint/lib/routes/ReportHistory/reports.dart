import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  Map<int, Color> colorCodes = {
    50: Color.alphaBlend(Colors.white.withOpacity(.9), color),
    100: Color.alphaBlend(Colors.white.withOpacity(.8), color),
    200: Color.alphaBlend(Colors.white.withOpacity(.6), color),
    300: Color.alphaBlend(Colors.white.withOpacity(.4), color),
    400: Color.alphaBlend(Colors.white.withOpacity(.2), color),
    500: color,
    600: Color.alphaBlend(Colors.black.withOpacity(.1), color),
    700: Color.alphaBlend(Colors.black.withOpacity(.2), color),
    800: Color.alphaBlend(Colors.black.withOpacity(.4), color),
    900: Color.alphaBlend(Colors.black.withOpacity(.6), color),
  };
  return MaterialColor(color.value, colorCodes);
}

class HospitalReportsPage extends StatelessWidget {
  const HospitalReportsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital Reports'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
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
                  selectedColor: Colors.teal,
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
                            style: const TextStyle(
                              color: Colors.green,
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: createMaterialColor(const Color.fromARGB(255, 9, 222, 255)), // Custom teal color
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        bodyMedium: TextStyle(fontSize: 14),
      ),
    ),
    home: const HospitalReportsPage(),
  ));
}
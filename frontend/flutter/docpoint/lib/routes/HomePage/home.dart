import 'package:flutter/material.dart';
import '../base.dart';

class HospitalLandingPage extends StatelessWidget {
  const HospitalLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Home",
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/family.jpg', // Background image for the whole page
              fit: BoxFit.cover,
            ),
          ),

          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),

          // Content Box (Top-aligned)
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20), // Adds space from top
              child: Container(
                width: double.infinity, // Full width
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2), // Black background with transparency
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF3B3232).withOpacity(0.5), // Shadow for depth
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Content takes needed space
                  children: [
                    // Tagline
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // Lighter background for contrast
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Best Multi Speciality Hospital in Tolichowki Hyderabad",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Main Title
                    const Text(
                      "Your Health, Our\nPassion",
                      style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Description
                    const Text(
                      "Muslim General Hospital Tolichowki consists of a highly trained team of medical experts, "
                      "advanced facilities, and unwavering commitment to the welfare of our patients.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Appointment Button
                    ElevatedButton(
                      onPressed: () {
                        navigateToPage(context, 'appointment');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Book An Appointment",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavItems: defaultBottomNavItems,
      onBottomNavTap: (index) {
        if (index == 1) {
          navigateToPage(context, 'appointment');
        } else if (index == 2) {
          navigateToPage(context, 'payment');
        } else {
          navigateToPage(context, 'home');
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

// Common theme colors
const Color primaryColor = Colors.teal;
const Color accentColor = Colors.tealAccent;
const Color textColor = Colors.white;

// Base widget that can be extended by other route pages
class BasePage extends StatelessWidget {
  final String title;
  final Widget body;
  final List<BottomNavigationBarItem>? bottomNavItems;
  final Function(int)? onBottomNavTap;

  const BasePage({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavItems,
    this.onBottomNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, accentColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 5,
            centerTitle: true,
            title: Text(
              title,
              style: const TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/logo1.png'),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.menu, color: textColor),
                onPressed: () {
                  // Implement hamburger menu functionality
                },
              ),
            ],
          ),
        ),
      ),

      body: body,

      // Gradient Bottom Navigation Bar
      bottomNavigationBar: bottomNavItems != null
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, accentColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                selectedItemColor: textColor,
                unselectedItemColor: Colors.white70,
                elevation: 0,
                items: bottomNavItems!,
                onTap: onBottomNavTap,
              ),
            )
          : null,
    );
  }
}

// Common bottom navigation items
final List<BottomNavigationBarItem> defaultBottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.calendar_today),
    label: 'Appointments',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.local_hospital),
    label: 'Reports',
  ),
];

// Common navigation function
void navigateToPage(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
} 
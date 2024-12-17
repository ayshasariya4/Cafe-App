import 'package:flutter/material.dart';
import 'home_page.dart';
import 'wishlist_page.dart';
import 'profile_page.dart';
import 'bottom_nav.dart';

void main() {
  runApp(CafeApp());
}

class CafeApp extends StatefulWidget {
  @override
  _CafeAppState createState() => _CafeAppState();
}

class _CafeAppState extends State<CafeApp> {
  int _currentIndex = 0;

  // Navigation tabs
  final List<Widget> _pages = [
    HomePage(),      // Home Page
    WishlistPage(),  // Wishlist Page
    ProfilePage(),   // Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Café ASM',
            style: TextStyle(
              color: Colors.brown[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFFECB176),
          elevation: 0,
        ),
        body: _pages[_currentIndex], // Displays selected page content
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update selected tab
            });
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'bottom_nav.dart';
import 'package:test_app/wishlist_page.dart';

void main() {
  runApp(CafeApp());
}

class CafeApp extends StatefulWidget {
  @override
  _CafeAppState createState() => _CafeAppState();
}

class _CafeAppState extends State<CafeApp> {
  int _currentIndex = 0;

  // Example wishlist items list
  List<Map<String, String>> wishlistItems = [];

  // Navigation tabs
  final List<Widget> _pages = [
    HomePage(),      // Home Page
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
        body: _currentIndex == 1
            ? WishlistPage(wishlistItems: wishlistItems) // Show WishlistPage when tab 1 is selected
            : _pages[_currentIndex], // Shows HomePage or ProfilePage
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

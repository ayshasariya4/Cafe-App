import 'package:flutter/material.dart';
import 'package:test_app/wishlist_page.dart';


class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // List to store wishlist items
  final List<Map<String, String>> wishlistItems = [];

  // Menu items data
  final List<Map<String, String>> menuItems = [
    {'title': 'Espresso', 'description': 'Rich and creamy espresso shot', 'price': '\$3.00'},
    {'title': 'Cappuccino', 'description': 'Smooth blend of espresso and frothy milk', 'price': '\$4.00'},
    {'title': 'Latte', 'description': 'Silky steamed milk with espresso', 'price': '\$4.50'},
    {'title': 'Mocha', 'description': 'Espresso with a touch of chocolate', 'price': '\$5.00'},
  ];

  // Function to add an item to the wishlist
  void _addToWishlist(Map<String, String> item) {
    setState(() {
      if (!wishlistItems.contains(item)) {
        wishlistItems.add(item);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item['title']} added to wishlist!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item['title']} is already in your wishlist!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color(0xFFECB176),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              // Navigate to Wishlist Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistPage(wishlistItems: wishlistItems),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 3,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                item['title']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[900],
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['description']!, style: TextStyle(color: Colors.brown[700])),
                  SizedBox(height: 5),
                  Text(
                    item['price']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Add to Cart Icon
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart, color: Color(0xFFECB176)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item['title']} added to cart!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                  // Add to Wishlist Icon
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.redAccent),
                    onPressed: () => _addToWishlist(item),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

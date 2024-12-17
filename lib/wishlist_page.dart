import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  final List<Map<String, String>> wishlistItems;

  WishlistPage({required this.wishlistItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Wishlist'),
        backgroundColor: Color(0xFFECB176),
      ),
      body: wishlistItems.isEmpty
          ? Center(
              child: Text(
                'Your Wishlist is Empty!',
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];
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
                    subtitle: Text(item['description']!),
                    trailing: Text(
                      item['price']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[900],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

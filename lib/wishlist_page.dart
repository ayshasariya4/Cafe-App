import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // Wishlist items: initially empty
  final List<Map<String, String>> wishlistItems = [];

  // Function to remove an item from the wishlist
  void _removeFromWishlist(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item removed from wishlist!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['description']!,
                          style: TextStyle(color: Colors.brown[700]),
                        ),
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
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        _removeFromWishlist(index);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}

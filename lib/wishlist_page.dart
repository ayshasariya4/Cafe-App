import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Your Wishlist is Empty!',
        style: TextStyle(fontSize: 20, color: Colors.redAccent),
      ),
    );
  }
}

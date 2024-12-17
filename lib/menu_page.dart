import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final List<Map<String, String>> menuItems = [
    {'title': 'Espresso', 'description': 'Rich and creamy espresso shot', 'price': '\$3.00'},
    {'title': 'Cappuccino', 'description': 'Smooth blend of espresso and frothy milk', 'price': '\$4.00'},
    {'title': 'Latte', 'description': 'Silky steamed milk with espresso', 'price': '\$4.50'},
    {'title': 'Mocha', 'description': 'Espresso with a touch of chocolate', 'price': '\$5.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color(0xFFECB176),
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
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart, color: Color(0xFFECB176)),
                onPressed: () {
                  // Action when "Add to Cart" is pressed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item['title']} added to cart!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

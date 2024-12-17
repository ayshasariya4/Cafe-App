import 'package:flutter/material.dart';
import 'package:test_app/menu_page.dart';



void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     'Café ASM',
        //     style: TextStyle(
        //       color: Colors.brown[900],
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   backgroundColor: const Color(0xFFECB176),
        //   elevation: 0,
        // ),
        body: CafeBody(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class CafeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner Section with Network Image
          Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1541167760496-1628856ab772', // sample café image from Unsplash
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Café ASM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Where every sip is a delight!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Welcome Text Section with Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Indulge in the finest coffee and pastries crafted with love!',
                  style: TextStyle(
                    color: Colors.brown[900],
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFECB176),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Order Now'),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFede0d4),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Reserve a Table'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Menu Section with Elevated Cards and Network Images
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Our Menu',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.brown[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                CafeMenuItem(
                  title: 'Espresso',
                  description: 'Rich and creamy espresso shot',
                  price: '\$3.00',
                  imageUrl:
                      'https://images.unsplash.com/photo-1551024506-0bccd828d307', // espresso image from Unsplash
                ),
                CafeMenuItem(
                  title: 'Cappuccino',
                  description: 'A smooth blend of espresso and frothy milk',
                  price: '\$4.00',
                  imageUrl:
                      'https://images.unsplash.com/photo-1517685352821-92cf88aee5a5', // cappuccino image from Unsplash
                ),
                CafeMenuItem(
                  title: 'Latte',
                  description: 'Silky steamed milk with a shot of espresso',
                  price: '\$4.50',
                  imageUrl:
                      'https://images.unsplash.com/photo-1509042239860-f550ce710b93', // latte image from Unsplash
                ),
                CafeMenuItem(
                  title: 'Mocha',
                  description: 'Espresso with a touch of chocolate',
                  price: '\$5.00',
                  imageUrl:
                      'https://images.unsplash.com/photo-1533750516457-a7f992034fec', // mocha image from Unsplash
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CafeMenuItem extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  CafeMenuItem({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.brown[700],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                color: Colors.brown[900],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Picture Section
          Container(
            margin: EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1601233742907-444b53e20954', // Sample profile picture
              ),
            ),
          ),
          SizedBox(height: 10),
          // User Name
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown[900],
            ),
          ),
          SizedBox(height: 5),
          // User Email
          Text(
            'johndoe@example.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),

          // Profile Details Section
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFFf7f3e9),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildProfileDetailRow(
                  icon: Icons.phone,
                  title: 'Phone Number',
                  value: '+1 123 456 7890',
                ),
                Divider(),
                _buildProfileDetailRow(
                  icon: Icons.location_on,
                  title: 'Address',
                  value: '123, Coffee Lane, Seattle, WA',
                ),
                Divider(),
                _buildProfileDetailRow(
                  icon: Icons.cake,
                  title: 'Birthday',
                  value: 'January 1, 1990',
                ),
              ],
            ),
          ),
          SizedBox(height: 30),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Add edit action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFECB176),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Icon(Icons.edit, color: Colors.white),
                label: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 15),
              ElevatedButton.icon(
                onPressed: () {
                  // Add logout action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper Widget for Profile Detail Row
  Widget _buildProfileDetailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.brown[700]),
        SizedBox(width: 15),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.brown[900],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

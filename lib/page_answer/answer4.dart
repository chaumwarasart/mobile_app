import 'package:flutter/material.dart';

class Answer4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous page
            },
          ),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            color: Colors.blue,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 10),
                Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Profile Info Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 10),
                    Text("user@example.com"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.blue),
                    SizedBox(width: 10),
                    Text("123-456-7890"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 10),
                    Text("123 Main Street"),
                  ],
                ),
              ],
            ),
          ),
          // Add Spacer to push buttons to the bottom
          Spacer(),
          // Buttons Section (at the bottom)
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Edit Profile"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Logout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

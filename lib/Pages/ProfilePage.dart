import 'package:agriboost/StartPages/FrontPage.dart';
import 'package:agriboost/StartPages/SplashSceen.dart';
import 'package:agriboost/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 241, 241, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Sample profile image
            ),
            const SizedBox(height: 10),

            // User Details
            const Text(
              "Utkarsh Pal",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Flutter Developer | Tech Enthusiast",
              style: TextStyle(color: Colors.grey),
            ),

            const Divider(thickness: 1, height: 30),

            // Contact Information
            const ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title: Text('utkarsh@example.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text('+91 98765 43210'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text('Ghaziabad, India'),
            ),

            const Divider(thickness: 1, height: 30),

            // Social Media Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.linked_camera, color: Colors.blue),
                  onPressed: () {}, // Add LinkedIn link
                ),
                IconButton(
                  icon: const Icon(Icons.web, color: Colors.green),
                  onPressed: () {}, // Add Portfolio link
                ),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.purple),
                  onPressed: () {}, // Add Instagram link
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () async {
                  // Add Logout functionality

                  await FirebaseAuth.instance.signOut();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => SplashScreen()),
                    (route) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Logged out successfully!")),
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

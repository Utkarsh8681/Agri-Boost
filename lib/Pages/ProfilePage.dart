import 'package:agriboost/StartPages/SplashSceen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  // Future<void> _openLink(BuildContext context, String url) async {
  //   final Uri uri = Uri.parse(url);
  //   try {
  //     if (await canLaunchUrl(uri)) {
  //       await launchUrl(uri, mode: LaunchMode.externalApplication);
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Could not launch $url')),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error launching URL: $e')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 241, 241, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Sample profile image
            ),
            const SizedBox(height: 10),
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
            const ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title: Text('utkarsh8671@gmail.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone, color: Colors.green),
              title: Text('+91 88449604331'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on, color: Colors.green),
              title: Text('Ghaziabad, India'),
            ),
            const Divider(thickness: 1, height: 30),

            // Social Media Links with Builder for context
            Builder(
              builder: (innerContext) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/linkedin.svg",
                        height: 30,
                        width: 30,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        launch("https://www.linkedin.com/in/utkarshpal/");
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.web, color: Colors.green),
                      onPressed: () {
                        launch('https://utflutterportfolio.netlify.app/');
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/instagram.svg",
                        height: 30,
                        width: 30,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        launch("https://www.instagram.com/utkarsh8671");
                      },
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const SplashScreen()),
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

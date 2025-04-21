import 'package:agriboost/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> requestNotificationPermission() async {
      if (await Permission.notification.isGranted) {
        const CircularProgressIndicator();
        await Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Homepage()));
      } else {
        // Request permission
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Homepage()));

        await Permission.notification.request();
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 241, 241, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 160.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/notification.jpg"),
                    const Text(
                      "Allow Notifications",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "To receive important trends, weather alerts and helpful farming tips.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Homepage()));
                      },
                      child: const Text("Skip",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800)),
                    ),
                    GestureDetector(
                      onTap: () {
                        requestNotificationPermission();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.black,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Allow",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

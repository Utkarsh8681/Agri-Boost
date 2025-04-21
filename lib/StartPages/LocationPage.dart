import 'package:agriboost/Pages/HomePage.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  // Future<void> checkLocationPermission() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled
  //     return Future.error('Location services are disabled.');
  //   }

  //   // Check permission status
  //   permission = await Geolocator.checkPermission();

  //   if (permission == LocationPermission.denied) {
  //     // Request permission
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are permanently denied
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When permissions are granted, get location
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);

  //   print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  // }

  @override
  Widget build(BuildContext context) {
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
                    Image.asset("assets/location.jpg"),
                    const Text(
                      "Access to device location",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "To provide you with localized content, AgriBoost needs access to your device’s location.",
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
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const Homepage()),
                          (Route<dynamic> route) => false,
                        ); // or push to another page if ne
                      },
                      child: const Text("Skip",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w800)),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const Homepage()),
                          (Route<dynamic> route) => false,
                        ); // or push to another page if ne
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

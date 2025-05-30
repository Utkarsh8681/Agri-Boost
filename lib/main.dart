import 'package:agriboost/StartPages/SplashSceen.dart';
import 'package:agriboost/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:webview_flutter/webview_flutter.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //   apiKey: dotenv.env['FIREBASE_API_KEY']!,
      //   appId: dotenv.env['FIREBASE_APP_ID']!,
      //   messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
      //   projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
      //   storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
      // ),
      options: DefaultFirebaseOptions.currentPlatform);
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // 👈 Start here every time
    );
  }
}

// class AuthWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return SplashScreen(); // use splash while waiting
//         } else if (snapshot.hasData) {
//           return Homepage();
//         } else {
//           return FrontPage();
//         }
//       },
//     );
//   }
// }



// WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
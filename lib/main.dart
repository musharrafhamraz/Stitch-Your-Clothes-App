import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tailorapp/auth/login_screen.dart';
import 'package:tailorapp/auth/sign_up_screen.dart';
import 'package:tailorapp/screens/customer_side/customer_dashboard.dart';
// import 'package:tailorapp/screens/tailor_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Gallery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified
          ? const UserMenuListScreen()
          : const LoginScreen(),

      // home: FirebaseAuth.instance.currentUser != null &&
      //         FirebaseAuth.instance.currentUser!.emailVerified
      //     ? FirebaseAuth.instance.currentUser!.email != 'foodgallery@gmail.com'
      //         ? const UserMenuListScreen()
      //         : const LoginScreen()
      //     : const TailorDashboard(),

      routes: {
        '/signup': (context) => const SignupScreen(),
      },
    );
  }
}

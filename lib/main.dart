import 'package:beespokeapp/Screens/Splash.dart';
import 'package:beespokeapp/Screens/login.dart';
import 'package:flutter/material.dart';
import 'Screens/Onboarding_1.dart';
import 'Screens/onboarding_2_screen.dart';
import 'Screens/product_feed_Screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splash_screen(),
    );
  }
}


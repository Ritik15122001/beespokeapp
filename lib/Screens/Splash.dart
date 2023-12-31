import 'dart:async';
import 'package:beespokeapp/Screens/Onboarding_1.dart';
import 'package:flutter/material.dart';
class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(_fadeInPageRoute())
    );
  }

  PageRouteBuilder _fadeInPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => onboarding_1(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        var tween = Tween(begin: begin, end: end);
        var opacityAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: opacityAnimation,
          child: child,
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Image(image: AssetImage("Images/logo.png"),width: 300,),
      ),
    );
  }
}

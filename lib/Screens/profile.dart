import 'package:beespokeapp/Screens/login.dart';
import 'package:beespokeapp/Screens/product_feed_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final avatarRadius = isPortrait ? 60.0 : 100.0;


    PageRouteBuilder _fadeInPageRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>ProductFeed(),
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
    PageRouteBuilder _fadeInPageRoute2() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>LoginScreen(),
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

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //       label: 'Messages',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.payment),
      //       label: 'Payment',
      //     ),
      //   ],
      //   currentIndex: 0,
      //   // Implement navigation logic here for the bottom navigation items
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: avatarRadius,
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              SizedBox(height: isPortrait ? 20.0 : 40.0),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: isPortrait ? 24.0 : 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: isPortrait ? 10.0 : 20.0),
              Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: isPortrait ? 16.0 : 24.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: isPortrait ? 20.0 : 40.0),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.of(context).pushReplacement(_fadeInPageRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
                onTap: () {
                  Navigator.of(context).pushReplacement(_fadeInPageRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Payment'),
                onTap: () {
                  Navigator.of(context).pushReplacement(_fadeInPageRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('My Orders'),
                onTap: () {
                  Navigator.of(context).pushReplacement(_fadeInPageRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                onTap: () {
                  Navigator.of(context).pushReplacement(_fadeInPageRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Refer a Friend'),
                onTap: () {
                  Navigator.of(context).pushReplacement(_fadeInPageRoute());
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  Navigator.of(context).pushReplacement(_fadeInPageRoute2());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

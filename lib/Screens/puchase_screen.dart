import 'dart:convert';

import 'package:beespokeapp/Component/SignUp_Btn.dart';
import 'package:beespokeapp/Component/name.dart';
import 'package:beespokeapp/DataModel/Utilities/utility.dart';
import 'package:beespokeapp/Screens/login.dart';
import 'package:beespokeapp/Screens/product_feed_Screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:beespokeapp/Component/Button.dart';
import 'package:beespokeapp/Component/SquareTiles.dart';
import 'package:beespokeapp/Component/TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'package:beespokeapp/Screens/profile.dart';

class mybag extends StatefulWidget {
  const mybag({super.key});

  @override
  State<mybag> createState() => _mybagState();
}

class _mybagState extends State<mybag> {
  TextEditingController searchctrlr = TextEditingController();
  int _selectedIndex = 0; // New

  Future<List> _getProduct() async {
    var url = Uri.parse(kProductUrl);
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    return data;
  }

  @override
  void initState() {
    // _getProduct();
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Now you can perform navigation based on the selected index if needed.
    if (_selectedIndex == 1) {
      // Navigate to the cart screen.
      Navigator.of(context).pushReplacement(_fadeInPageRoute());
    } else if (_selectedIndex == 2) {
      Navigator.of(context).pushReplacement(_fadeInPageRoute3());
    } else if (_selectedIndex == 3) {
      Navigator.of(context).pushReplacement(_fadeInPageRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchctrlr,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Search You Product',
                  suffixIcon: searchctrlr.text.isEmpty
                      ? const Icon(Icons.search)
                      : GestureDetector(
                      onTap: () {
                        searchctrlr.text = "";
                        setState(() {});
                      },
                      child: Icon(Icons.clear)),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List>(
                  future: _getProduct(),
                  builder:
                      (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    print(snapshot);
                    if (!snapshot.hasData) {
                      return ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            enabled: true,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  title: Container(
                                    width: 100,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    width: double.infinity,
                                    height: 8.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data != null
                              ? snapshot.data!.length
                              : 0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      snapshot.data![index]['image'],
                                      height: height * 0.5,
                                      width: width,
                                    ),
                                    ListTile(
                                      title: Text(
                                        snapshot.data![index]['title'],
                                        style: TextStyle(
                                            color: Colors.pinkAccent,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                          snapshot.data![index]['description']),
                                    ),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          width: 200,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'CheckOut',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                  _fadeInPageRoute()),
                                          icon: Icon(
                                              Icons.skip_previous_outlined),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'MyProfile',
          ),
        ],
        currentIndex: _selectedIndex, // New
        onTap: _onItemTapped, // New
      ),
    );
  }

  PageRouteBuilder _fadeInPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProductFeed(),
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

  PageRouteBuilder _fadeInPageRoute3() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
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
}

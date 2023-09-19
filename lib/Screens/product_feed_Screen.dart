import 'dart:convert';
import 'package:beespokeapp/DataModel/Utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:beespokeapp/Screens/puchase_screen.dart';
import 'package:beespokeapp/Screens/profile.dart';
class ProductFeed extends StatefulWidget {
  const ProductFeed({super.key});

  @override
  State<ProductFeed> createState() => _ProductFeedState();
}

class _ProductFeedState extends State<ProductFeed> {
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
    }else if (_selectedIndex == 3) {
      Navigator.of(context).pushReplacement(_fadeInPageRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
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
            icon: Icon(Icons.person_2_outlined),
            label: 'MyProfile',
          ),
        ],
        currentIndex: _selectedIndex, // Updated
        onTap: _onItemTapped,         // Updated
      ),
      body: FutureBuilder<List>(
        future: _getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data != null ? snapshot.data!.length : 0,
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(snapshot.data![index]['description']),
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
                                'Buy Now',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          IconButton(
                            onPressed: () =>
                                Navigator.of(context).pushReplacement(_fadeInPageRoute()),
                            icon: Icon(Icons.add_shopping_cart),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

PageRouteBuilder _fadeInPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>mybag(),
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
PageRouteBuilder _fadeInPageRoute3() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>ProfileScreen(),
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

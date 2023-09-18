import 'dart:async';

import 'package:beespokeapp/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:beespokeapp/Screens/onborading_3_Screen.dart';
class onboarding2 extends StatefulWidget {
  const onboarding2({super.key});

  @override
  State<onboarding2> createState() => _onboarding2State();
}

class _onboarding2State extends State<onboarding2> {
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
      pageBuilder: (context, animation, secondaryAnimation) => onboarding3(),
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
    final width =MediaQuery.of(context).size.width;
    final height =MediaQuery.of(context).size.height;
    return  Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height*0.1,left: width*0.15),
                  child: Column(
                    children: [
                      Image(image: AssetImage("Images/logo.png"),width: 250,),
                      Row(

                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: width*0.9,
              height: height*0.55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),

              ),
              child: Center(
                child: AspectRatio(
                  aspectRatio: 0.9,
                  child: Lottie.asset('Images/data1.json',fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width*0.08),
              child: Text('Discover, Decide, Shop: AI at Your Service ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top:height*0.04,left: width*0.32),
                      child: Container(
                          width: width*0.1,
                          height: height*0.015,
                          decoration: const BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                              color : Colors.black
                          )
                      ),
                    ),

                  ],

                ),
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top:height*0.04,left: width*0.03),
                      child: Container(
                          width: width*0.1,
                          height: height*0.015,
                          decoration: const BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                              color : Colors.pinkAccent
                          )
                      ),
                    ),

                  ],

                ),
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top:height*0.04,left: width*0.03),
                      child: Container(
                          width: width*0.1,
                          height: height*0.015,
                          decoration: const BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(23),
                                topRight: Radius.circular(23),
                                bottomLeft: Radius.circular(23),
                                bottomRight: Radius.circular(23),
                              ),
                              color : Colors.black
                          )
                      ),
                    ),

                  ],

                ),
              ],

            ),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:height*0.02,left: width*0.2),
                  child: InkWell(
                    onTap: () => Navigator.of(context).pushReplacement(_fadeInPageRoute()),
                    child: Container(
                      width: width*0.6,
                      height: height*0.069,
                      decoration: const BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(23),
                            topRight: Radius.circular(23),
                            bottomLeft: Radius.circular(23),
                            bottomRight: Radius.circular(23),
                          ),
                          color : Colors.pink
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(top:height*0.02,left: width*0.18),
                        child: Text('CONTINUE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            )

          ],

        )

    );
  }
}
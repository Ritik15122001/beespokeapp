import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:beespokeapp/Screens/onboarding_2_screen.dart';
class onboarding_1 extends StatefulWidget {
  const onboarding_1({super.key});

  @override
  State<onboarding_1> createState() => _onboarding_1State();
}

class _onboarding_1State extends State<onboarding_1> {
  @override
  void initState(){
    super.initState();
    Timer(
        Duration(seconds: 3),
            ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>onboarding2()))
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
                  child: Lottie.asset('Images/data.json',fit: BoxFit.cover),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.only(left: width*0.08),
              child: Text('Elevate Your Shopping Experience with AI Innovation',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
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
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>onboarding2()));},
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
                        padding:  EdgeInsets.only(top:height*0.02,left: width*0.09),
                        child: Text('LET`S GET STARTED',
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
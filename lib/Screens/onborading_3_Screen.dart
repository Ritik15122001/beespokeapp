import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class onboarding3 extends StatefulWidget {
  const onboarding3({super.key});

  @override
  State<onboarding3> createState() => _onboarding3State();
}

class _onboarding3State extends State<onboarding3> {
  @override
  Widget build(BuildContext context) {
    final width =MediaQuery.of(context).size.width;
    final height =MediaQuery.of(context).size.height;
    return  Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height*0.1,left: width*0.10),
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
                  child: Lottie.asset('Images/data3.json',fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width*0.08),
              child: Text('Your AI Shopping Assistant for a Better World',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
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
              ],

            ),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top:height*0.02,left: width*0.2),
                  child: InkWell(
                    onTap: (){print("Navigate");},
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
                          color : Colors.pinkAccent
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,left: 50),
                        child: Text('GET STARTED',
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
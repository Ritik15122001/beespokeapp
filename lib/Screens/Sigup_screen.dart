import 'package:beespokeapp/Component/SignUp_Btn.dart';
import 'package:beespokeapp/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:beespokeapp/Component/Button.dart';
import 'package:beespokeapp/Component/SquareTiles.dart';
import 'package:beespokeapp/Component/TextField.dart';

class SignUp_Screen extends StatelessWidget {
  SignUp_Screen({Key? key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed:  (){Navigator.pop(context,true);}
        ),
        title: Row(
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 28),
            ),
          ],
        ),
        backgroundColor: Colors.white, //<-- SEE HERE
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                // welcome back, you've been missed!
                Text(
                  'Your Journey Begins Here - Sign Up Now',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Name',
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?


                const SizedBox(height: 25),

                // sign in button
               SignUp_btn(onTap: signUserIn),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: Text(
                          'Thanks For Your Registration',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                // Google + Apple sign in buttons (uncomment when needed)
                /*
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    // google button
                    SquareTile(imagePath: 'lib/images/google.png'),
                    // apple button
                    SquareTile(imagePath: 'lib/images/apple.png')
                  ],
                ),
                */

                // not a member? register now
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Not a member?',
                //       style: TextStyle(color: Colors.grey[700]),
                //     ),
                //     const SizedBox(width: 4),
                //     GestureDetector(
                //       onTap: (){print("Clicked");},
                //       child: Text(
                //         'Register now',
                //         style: TextStyle(
                //           color: Colors.blue,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
PageRouteBuilder _fadeInPageRoute() {
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

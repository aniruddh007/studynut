// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studynut/constants/constantcolors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Constantcolors constantcolors = Constantcolors();

  @override
  // void initState() {
  //   Timer(
  //       const Duration(seconds: 1),
  //       () => Navigator.pushReplacement(
  //           context,
  //           PageTransition(
  //               child: const LandingScreen(),
  //               type: PageTransitionType.rightToLeft)));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: constantcolors.darkblue,
      body: Center(
        child: Image.asset("lib/assets/images/logo.png"),
          // child: RichText(
          //     text: TextSpan(
          //         text: "study",
          //         style: TextStyle(
          //             fontSize: 40,
          //             fontWeight: FontWeight.bold,
          //             color: constantcolors.bluecolor),
          //         children: <TextSpan>[
          //   TextSpan(
          //     text: "Nut",
          //     style: TextStyle(
          //         fontSize: 45,
          //         fontWeight: FontWeight.bold,
          //         color: constantcolors.greycolor),
          //   )
          // ]))
          ),
    );
  }
}

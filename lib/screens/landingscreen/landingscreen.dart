import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studynut/screens/landingscreen/landing_helpers.dart';

import '../../constants/constantcolors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final Constantcolors constantcolors = Constantcolors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bodycolor(),
          Provider.of<LandingHelpers>(context, listen: false)
              .bodyImage(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .taglineText(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .mainButton(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .privacyText(context),
        ],
      ),
    );
  }

  bodycolor() {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [constantcolors.darkyellowcolor, constantcolors.darkblue])),
    );
  }
}

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:studynut/constants/constantcolors.dart';

class LandingHelpers with ChangeNotifier {
  Constantcolors constantcolors = Constantcolors();
  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/login_image.png'))),
    );
  }

  Widget taglineText(BuildContext context) {
    return Positioned(
        top: 450,
        left: 40,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: RichText(
            text: TextSpan(
                text: "Let's",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: constantcolors.bluecolor),
                children: <TextSpan>[
                  TextSpan(
                    text: " Explore the ",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: constantcolors.yellowcolor),
                  ),
                  TextSpan(
                    text: "shell...",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: constantcolors.yellowcolor),
                  )
                ]),
          ),
        ));
  }

  Widget mainButton(BuildContext context) {
    return Positioned(
        top: 630,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // Provider.of<LandingServices>(context, listen: false)
                  //     .loginSheet(context);
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: constantcolors.yellowcolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    EvaIcons.emailOutline,
                    color: constantcolors.yellowcolor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Provider.of<Authentication>(context, listen: false)
                  //     .signInWithGoogle()
                  //     .whenComplete(() {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       PageTransition(
                  //           child: HomePage(),
                  //           type: PageTransitionType.rightToLeft));
                  // });
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: constantcolors.redcolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    EvaIcons.google,
                    color: constantcolors.redcolor,
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: constantcolors.bluecolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    EvaIcons.facebook,
                    color: constantcolors.bluecolor,
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget privacyText(BuildContext context) {
    return Positioned(
        top: 740,
        left: 20,
        right: 20,
        child: Column(
          children: [
            Text(
              "By continuing you Agree the Studynut's Terms of ",
              style: TextStyle(color: constantcolors.greycolor, fontSize: 12),
            ),
            Text(
              "Services and Privacy Policy ",
              style: TextStyle(color: constantcolors.greycolor, fontSize: 12),
            ),
          ],
        ));
  }

  emailAuthSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150.0),
                child: Divider(
                  thickness: 4.0,
                  color: constantcolors.whitecolor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: constantcolors.bluecolor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Provider.of<LandingServices>(context, listen: false)
                          // .loginSheet(context);
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: constantcolors.redcolor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    onTap: () {
                      // Provider.of<LandingUtils>(context, listen: false)
                          // .selectUserAvtar(context);
                    },
                  ),
                ],
              )
            ]),
          );
        });
  }
}

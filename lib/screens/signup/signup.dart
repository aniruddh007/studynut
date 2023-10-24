import 'package:flutter/material.dart';
import 'package:studynut/screens/signup/local_widgets/signup_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: const <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    BackButton(),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                SignUpForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:studynut/screens/login/local_widgets/login_form.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.asset("lib/assets/images/logo.png"),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const LogInForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

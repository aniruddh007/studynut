import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:studynut/screens/login/login.dart';
import 'package:provider/provider.dart';
import 'package:studynut/screens/root/root.dart';
import 'package:studynut/states/current_user.dart';
import 'package:studynut/utils/our_theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OurRoot(),
        theme: OurTheme().buildTheme(),
      ),
    );
  }
}

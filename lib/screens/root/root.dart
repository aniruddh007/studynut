import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studynut/nogroup/nogroup.dart';
import 'package:studynut/screens/homescreen/homescreen.dart';
import 'package:studynut/screens/login/login.dart';
import 'package:studynut/screens/splashscreen.dart';
import 'package:studynut/states/current_group.dart';
import 'package:studynut/states/current_user.dart';

enum AuthStatus { notLoggedIn, unknown, notInGroup, inGroup }

class OurRoot extends StatefulWidget {
  const OurRoot({super.key});

  @override
  State<OurRoot> createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void didChangeDependencies() async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    String returnString = await currentUser.onStartUp();

    if (returnString == "success") {
      if (currentUser.getCurrentUser.groupId != null) {
        setState(() {
          _authStatus = AuthStatus.inGroup;
        });
      } else {
        setState(() {
          _authStatus = AuthStatus.notInGroup;
        });
      }
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;
    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        retVal = const LogIn();
        return retVal;
      case AuthStatus.unknown:
        retVal = const SplashScreen();
        return retVal;
      case AuthStatus.notInGroup:
        retVal = const NoGroup();
        return retVal;
      case AuthStatus.inGroup:
        retVal = ChangeNotifierProvider(
            create: (BuildContext context) => CurrentGroup(),
            child: const HomePage());
        return retVal;

      default:
    }
    return Container();
  }
}

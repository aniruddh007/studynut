import 'package:flutter/material.dart';
import 'package:studynut/screens/creategroup/creategroup.dart';
import 'package:studynut/screens/joingroup/joingroup.dart';

class NoGroup extends StatelessWidget {
  const NoGroup({super.key});

  @override
  Widget build(BuildContext context) {

    // UserModel _currentUser = Provider.of<UserModel>(context);

    void goToJoin(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const JoinGroup(
            // userModel: _currentUser,
          ),
        ),
      );
    }

    void goToCreate(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateGroup(),
        ),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 1),
          Image.asset('lib/assets/images/login_image.png'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Welcome To StudyNut",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 123, 122, 122),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Since you are not in the StudyNut club , you can select either to join a Club or create a Club",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 123, 122, 122),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        elevation: const MaterialStatePropertyAll(2),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 213, 235, 220))),
                    onPressed: () => goToJoin( context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "  Join  ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 123, 122, 122),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    )),
                OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        elevation: const MaterialStatePropertyAll(5),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 123, 122, 122))),
                    onPressed: () => goToCreate(context),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Create",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

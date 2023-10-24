import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studynut/screens/root/root.dart';
import 'package:studynut/services/database.dart';
import 'package:studynut/states/current_user.dart';
import 'package:studynut/widgets/shadow_container.dart';

class JoinGroup extends StatefulWidget {
  const JoinGroup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JoinGroupState createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {

  void joinGroup(BuildContext context, String groupId) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context , listen: false);
    String returnString = await OurDatabase()
        .joinGroup(groupId, currentUser.getCurrentUser.uid);
    if (returnString == "success") {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => const OurRoot()), (route) => false);
    }
  }
  
  // void _goToAddBook(BuildContext context, String groupName) async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => OurAddBook(
  //         onGroupCreation: true,
  //         onError: false,
  //         groupName: groupName,
  //       ),
  //     ),
  //   );
  // }

  final TextEditingController _groupIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            // ignore: avoid_unnecessary_containers
            child: ShadowContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _groupIdController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Group Id",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        elevation: const MaterialStatePropertyAll(2),
                        backgroundColor: const MaterialStatePropertyAll(
                            Color.fromARGB(255, 123, 122, 122))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      child: Text(
                        "Join",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    // onPressed: () {},
                    onPressed: () =>
                        joinGroup(context, _groupIdController.text),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

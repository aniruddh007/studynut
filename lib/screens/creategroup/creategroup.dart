import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:studynut/screens/addbook/add_book.dart';
// import 'package:studynut/screens/root/root.dart';
// import 'package:studynut/services/database.dart';
// import 'package:studynut/states/current_user.dart';
import 'package:studynut/widgets/shadow_container.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  
  // void goToAddBook(BuildContext context, String groupName) async {
  //   CurrentUser currentUser = Provider.of<CurrentUser>(context , listen: false);
  //   String returnString = await OurDatabase()
  //       .createGroup(groupName, currentUser.getCurrentUser.uid);
  //   if (returnString == "success") {
  //     // ignore: use_build_context_synchronously
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => const OurRoot()));
  //   }
  // }
  void goToAddBook(BuildContext context, String groupName) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddBook(
          onGroupCreation: true,
          groupName: groupName,
        ),
      ),
    );
  }

  final TextEditingController _groupNameController = TextEditingController();
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
                    controller: _groupNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Group Name",
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
                        "Add Book",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () =>
                        goToAddBook(context, _groupNameController.text),
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

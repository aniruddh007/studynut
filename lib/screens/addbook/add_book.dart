import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studynut/models/book.dart';
import 'package:studynut/screens/root/root.dart';
import 'package:studynut/services/database.dart';
import 'package:studynut/states/current_user.dart';
import 'package:studynut/widgets/shadow_container.dart';

class AddBook extends StatefulWidget {
  final bool onGroupCreation;
  final String? groupName;
  const AddBook({
    super.key,
    required this.onGroupCreation,
    this.groupName,
  });
  @override
  // ignore: library_private_types_in_public_api
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController _bookNameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // Future<void> _selectDate( BuildContext context )async {
  //   final DateTime? picked = await DateTime.showDateTimePicker( context , showTitleActions: true );
  //   if( picked != null && picked != _selectedDate){
  //     setState(() {
  //     _selectedDate = picked ;

  //     });
  //   }
  // }

  void addBook(BuildContext context, String groupName, OurBook book) async {
    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);
    String? returnString;
    if (widget.onGroupCreation) {
      returnString = await OurDatabase()
        .createGroup(groupName, currentUser.getCurrentUser.uid, book);
    } 
    else {
      returnString= await  OurDatabase()
          .addBook(currentUser.getCurrentUser.groupId.toString(), book);
    }
    // await OurDatabase()
    //     .createGroup(groupName, currentUser.getCurrentUser.uid, book);
    if (returnString == "success") {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OurRoot()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                    controller: _bookNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.bookmark),
                      hintText: "Book Name",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _authorController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Author",
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _lengthController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.list),
                      hintText: "Length",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(_selectedDate.toString()),
                  TextButton(
                      onPressed: () {}, child: const Text("Change Date")),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          elevation: const MaterialStatePropertyAll(2),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 123, 122, 122))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        child: Text(
                          "Create",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        OurBook book = OurBook();
                        book.name = _bookNameController.text;
                        book.author = _authorController.text;
                        book.length = int.parse(_lengthController.text);
                        book.dateCompleted = Timestamp.now();

                        addBook(context, widget.groupName.toString(), book);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

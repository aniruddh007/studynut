import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:studynut/nogroup/nogroup.dart';
import 'package:studynut/screens/addbook/add_book.dart';
import 'package:studynut/screens/dashboard/user_dashboard.dart';
import 'package:studynut/screens/homescreen/pdfview.dart';
import 'package:studynut/screens/login/login.dart';
import 'package:studynut/states/current_group.dart';
import 'package:studynut/states/current_user.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CurrentUser currentUser = Provider.of<CurrentUser>(context, listen: false);

    CurrentGroup currentGroup =
        Provider.of<CurrentGroup>(context , listen: false);

    currentGroup
        .updateStateFromDatabase(currentUser.getCurrentUser.groupId.toString());
  }

  void _goToAddBook(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  AddBook( onGroupCreation: false,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserDashboard()));
                    },
                    icon: const Icon(EvaIcons.person)),
                IconButton(
                    onPressed: () async {
                      CurrentUser currentUser =
                          Provider.of<CurrentUser>(context, listen: false);
                      String returnString = await currentUser.signOut();
                      if (returnString == "success") {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogIn()),
                            (route) => false);
                      }
                    },
                    icon: Icon(EvaIcons.logOut)),
              ],
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(4, 4),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Consumer<CurrentGroup>(
                  builder: ( context, value, Widget? child) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            value.getCurrentBook.name.toString(),
                            style: const TextStyle(
                              fontSize: 27,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "Due In : ",
                                style: TextStyle(
                                  fontSize: 27,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  (value.getCurrentGroup.currentBookDue)!= null ?value.getCurrentGroup.currentBookDue!.toDate().toString() : "Loading",
                                  style: const TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: OutlinedButton(
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                    elevation:
                                        const MaterialStatePropertyAll(5),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.grey)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PdfViewer()));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "Read Book",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                )),
                          ),
                        ]);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(4, 4),
                    )
                  ]),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next Book Revealed In : ',
                        style: TextStyle(
                          fontSize: 27,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '22 Hours',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          // color: Colors.grey,
                        ),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: OutlinedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      elevation: const MaterialStatePropertyAll(5),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 213, 235, 220))),
                  onPressed: () => _goToAddBook(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "StudyNut History",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: OutlinedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      elevation: const MaterialStatePropertyAll(5),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.grey)),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Chat",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

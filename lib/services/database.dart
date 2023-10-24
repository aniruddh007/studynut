import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studynut/models/book.dart';
import 'package:studynut/models/group.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:studynut/models/users.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser user) async {
    String retval = "error";

    try {
      _firestore.collection("users").doc(user.uid).set({
        'fullName': user.fullName,
        'email': user.email,
        'accountCreated': Timestamp.now()
      });
      retval = "success";
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retval = OurUser(groupId: "");

    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection("users").doc(uid).get();
      retval.uid = uid;
      retval.fullName = docSnapshot.get("fullName");
      retval.email = docSnapshot.get("email");
      retval.accountCreated = docSnapshot.get("accountCreated");
      retval.groupId = docSnapshot.get("groupId");
    } catch (e) {
      print(e);
    }

    return retval;
  }

  Future<String> createGroup(
      String groupName, String? userUid, OurBook initialBook) async {
    String retval = "error";
    userUid = userUid.toString();
    List<dynamic> members = List.empty(growable: true);
    try {
      members.add(userUid);
      DocumentReference docRef = await _firestore.collection("groups").add({
        "name": groupName,
        "leader": userUid,
        "members": members,
        "groupCreated": Timestamp.now()
      });

      await _firestore
          .collection("users")
          .doc(userUid)
          .update({"groupId": docRef.id});

      addBook(docRef.id, initialBook);
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<String> joinGroup(String groupId, String? userUid) async {
    String retval = "error";
    userUid = userUid.toString();
    List<dynamic> members = List.empty(growable: true);
    try {
      members.add(userUid);
      await _firestore
          .collection("groups")
          .doc(groupId)
          .update({"members": FieldValue.arrayUnion(members)});
      await _firestore
          .collection("users")
          .doc(userUid)
          .update({"groupId": groupId});
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<OurGroup> getGroupInfo(String groupId) async {
    OurGroup retval = OurGroup();

    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection("groups").doc(groupId).get();
      retval.id = groupId;
      retval.name = docSnapshot.get("name");
      retval.leader = docSnapshot.get("leader");
      retval.members = List<String>.from(docSnapshot.get("members"));
      retval.groupCreated = docSnapshot.get("groupCreated");
      retval.currentBookId = docSnapshot.get("currentBookId");
      retval.currentBookDue = docSnapshot.get("currentBookDue");
    } catch (e) {
      print(e);
    }

    return retval;
  }

  Future<String> addBook(String groupId, OurBook book) async {
    String retval = "error";

    try {
      DocumentReference docref = await _firestore
          .collection("groups")
          .doc(groupId)
          .collection("books")
          .add({
        'name': book.name,
        'author': book.author,
        'length': book.length,
        'completedOn': book.dateCompleted
      });

      await _firestore.collection("groups").doc(groupId).update(
          {"currentBookId": docref.id, "currentBookDue": book.dateCompleted});
      retval = "success";
    } catch (e) {
      print(e);
    }
    return retval;
  }

  Future<OurBook> getCurrentBook(String groupId, String bookId) async {
    OurBook retval = OurBook();
    try {
      DocumentSnapshot docSnapshot = await _firestore
          .collection("groups")
          .doc(groupId)
          .collection('books')
          .doc(bookId)
          .get();
      retval.bookId = bookId;
      retval.name = docSnapshot.get("name");
      retval.author = docSnapshot.get("author");
      retval.length = docSnapshot.get("length");
      retval.dateCompleted = docSnapshot.get("dateCompleted");
    } catch (e) {
      print(e);
    }

    return retval;
  }
}

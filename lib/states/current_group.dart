import 'package:flutter/material.dart';
import 'package:studynut/models/book.dart';
import 'package:studynut/models/group.dart';
import 'package:studynut/services/database.dart';

class CurrentGroup extends ChangeNotifier {
  OurGroup currentGroup = OurGroup();
  OurBook currentBook = OurBook();

  OurGroup get getCurrentGroup => currentGroup;
  OurBook get getCurrentBook => currentBook;

  void updateStateFromDatabase(String groupId) async {
    try {
      currentGroup = await OurDatabase().getGroupInfo(groupId);
      currentBook = await OurDatabase()
          .getCurrentBook(groupId, currentGroup.currentBookId.toString());
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

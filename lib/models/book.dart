import 'package:cloud_firestore/cloud_firestore.dart';

class OurBook {
  String? bookId;
  String? name;
  int? length;
  Timestamp? dateCompleted;
  String? author;

  OurBook({this.bookId, this.name, this.length, this.dateCompleted , this.author});
}

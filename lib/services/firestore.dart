import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  //CREATE (add a new note)
  Future<void> addNote(String note) {
    return notes.add(
      {
        'note': note,
        'timestamp': Timestamp.now(),
      },
    );
  }

  //READ (get the notes from the database)
  Stream<QuerySnapshot> getNotes() {
    final noteStream = notes.orderBy('timestamp', descending: true).snapshots();

    return noteStream;
  }
}

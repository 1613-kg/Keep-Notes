import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:notes/models/notes_model.dart';
import 'db.dart';

class FireDB {
  //CREATE,READ,UPDATE,DELETE
  final FirebaseAuth _auth = FirebaseAuth.instance;

  createNewNoteFirestore(MyNotes note) async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email)
        .collection("usernotes")
        .doc(note.uniqueId)
        .set({
      "Title": note.title,
      "content": note.content,
      "date": note.createdTime,
      "uniqueId": note.uniqueId,
      "pin": note.pin,
      "archive": note.isArchive,
    }).then((_) {
      print("DATA ADDED SUCCESSFULLY");
    });
  }

  getAllStoredNotes() async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email)
        .collection("usernotes")
        .orderBy("date")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Map note = result.data();

        NotesDatabase.instance.insertNote(MyNotes(
            title: note["Title"],
            content: note["content"],
            uniqueId: note["uniqueId"],
            createdTime: DateTime.now(),
            pin: note["pin"],
            isArchive: note["archive"],
            isDeleted: false)); //Add Notes In Database
      });
    });
  }

  updateNoteFirestore(MyNotes note) async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email)
        .collection("usernotes")
        .doc(note.uniqueId.toString())
        .update({
      "Title": note.title.toString(),
      "content": note.content,
      "pin": note.pin,
      "archive": note.isArchive
    }).then((_) {
      print("DATA ADDED SUCCESFULLY");
    });
  }

  deleteNoteFirestore(MyNotes note) async {
    final User? current_user = _auth.currentUser;
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(current_user!.email.toString())
        .collection("usernotes")
        .doc(note.uniqueId.toString())
        .delete()
        .then((_) {
      print("DATA DELETED SUCCESS FULLY");
    });
  }
}

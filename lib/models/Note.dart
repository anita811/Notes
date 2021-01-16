import 'dart:core';
//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class Note
{
  String subject;
  String semester;
  String module;
  String chapter;
  save(){
    print("Note Saved");
  }
}

class DatabaseService {

  Future<void> addNotesData(Map notesData, String notesId) async {
    await Firebase.initializeApp();
    print("Note Saved");
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(notesId)
        .set(notesData)
        .catchError((e) {
      print(e);
      print("Error in note saving");
    });
  }

  getNotesData() async{
    await Firebase.initializeApp();
    print("Getting Note Details");
    return await FirebaseFirestore.instance
        .collection("notes")
        .snapshots();
  }

  Future<void> delQuizData(Map quizData, String quizId) async {
    await Firebase.initializeApp();
    await FirebaseFirestore.instance
        .collection("notes")
        .doc(quizId)
        .delete();
  }

}


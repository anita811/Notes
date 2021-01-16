import 'package:flutter/material.dart';
import 'Pages/Notes.dart';
import 'Pages/studentnote.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'STAA notes',
        theme: ThemeData(primarySwatch: Colors.blue,visualDensity: VisualDensity.adaptivePlatformDensity,),
        home:notesHomePage('')
    );
  }
}


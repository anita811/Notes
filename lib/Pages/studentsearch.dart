import 'package:flutter/material.dart';
import 'package:notes/Pages/StudentNoteListItem.dart';
class StudentSearch extends StatefulWidget
{

  @override
  _StudentSearchState createState() => _StudentSearchState();
}

class _StudentSearchState extends State<StudentSearch> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Available Notes"),
        centerTitle: true,
        elevation: 0.8,

      ),

      body:Container(
        child: ListView(
          children: [
            StudentNoteListItem('CSE', '12/12/2020',"System Analysis & Design (SAD)", '4','1',"Algorithm Design"),
            StudentNoteListItem('CSE', '12/12/2020',"System Analysis & Design (SAD)", '4','1',"Algorithm Design"),
            StudentNoteListItem('CSE', '12/12/2020',"System Analysis & Design (SAD)", '4','1',"Algorithm Design"),
            StudentNoteListItem('CSE', '12/12/2020',"System Analysis & Design (SAD)", '4','1',"Algorithm Design"),
            StudentNoteListItem('CSE', '12/12/2020',"System Analysis & Design (SAD)", '4','1',"Algorithm Design"),
            StudentNoteListItem('CSE', '12/12/2020',"System Analysis & Design (SAD)", '4','1',"Algorithm Design"),
            StudentNoteListItem('CSE', '12/12/2020',"System Analysis & Design (SAD)", '4','1',"Algorithm Design"),
          ],
        ),
      ),

    );

  }
}
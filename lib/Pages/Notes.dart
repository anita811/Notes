import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/Pages/NoteForm.dart';
import 'package:notes/Pages/NoteListItem.dart';
import 'package:notes/models/Note.dart';
class notesHomePage extends StatefulWidget {
  String userType;
  notesHomePage(this.userType);
  @override
  _notesHomePageState createState() => _notesHomePageState(this.userType);
}

class _notesHomePageState extends State<notesHomePage>
{
  String userType;
  _notesHomePageState(this.userType);
  Stream notesStream;
  DatabaseService databaseService = new DatabaseService();

  Widget notesList() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5,),
          StreamBuilder(
            stream: notesStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return NoteListItem(
                       snapshot.data.docs[index].data()['course'],
                       snapshot.data.docs[index].data()['subject'],
                       snapshot.data.docs[index].data()['sem'],
                       snapshot.data.docs[index].data()['module'],
                       snapshot.data.docs[index].data()['topic'],
                      snapshot.data.docs[index].data()['notesId'],
                       userType,
                    );
                  });
            },
          )
        ],
      ),
    );
  }
  @override
   void initState() {
     databaseService.getNotesData().then((val) {
       setState(() {
         notesStream = val;
       });
     });
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: 22

            ),
            children: <TextSpan>[
              TextSpan(text: 'STAA', style: TextStyle(fontWeight: FontWeight.w600
                  , color: Colors.white))
            ],
          ),
        ),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.blue,
        //brightness: Brightness.li,
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
//5
            return FlatButton(
              child: const Text('Sign out'),
              textColor: Theme
                  .of(context)
                  .buttonColor,
              onPressed: () async {
                final User user = await FirebaseAuth.instance.currentUser;
                if (user == null) {
//6
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text('No one has signed in.'),
                  ));
                  return;
                }
                await FirebaseAuth.instance.signOut();
                final String useremail = user.email;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(useremail + ' has successfully signed out.'),

                ));
               /* Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );*/
              },

            );
          })
        ],
      ),

      body:SingleChildScrollView(

          child:notesList(),
      ),
      floatingActionButton: getFAB(),

    );
  }
  Widget getFAB(){
    if(userType!="Student"){
      return  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
             Navigator.push(
           context, MaterialPageRoute(builder: (context) => NoteForm()));
    },
    );
    }
  }

}


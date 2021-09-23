import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_notes/components/noteCard.dart';
import 'package:keep_notes/constants/colorScheme.dart';
import 'package:keep_notes/firebase_layer/getNotes.dart';
import 'newNote.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List notes = [];
  List<Widget> noteCards = [];

  readyNotes() async {
    noteCards = [];
    notes = await getNotes();
    for (int i = 0; i < notes.length; i++) {
      noteCards.add(NoteCard(
        title: notes[i]['title'],
        note: notes[i]['note'],
      ));
    }
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.stickyNote,
              color: AppColorScheme.yellow,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'KEEP NOTES',
              style: TextStyle(
                  color: AppColorScheme.yellow,
                  fontFamily: 'Alphabet',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (notes.length == 0) {
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.frownOpen,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'No Notes Added',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                );
              } else {
                return GridView.count(
                  crossAxisCount: 2,
                  children: noteCards,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColorScheme.yellow,
                ),
              );
            }
          },
          future: readyNotes(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool flag = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Newpage()),
          );

          if (flag) {
            setState(() {});
          }
        },
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }
}

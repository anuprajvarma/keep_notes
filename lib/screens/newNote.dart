import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_notes/components/enums.dart';
import 'package:keep_notes/components/myTextfield.dart';
import 'package:keep_notes/constants/colorScheme.dart';
import 'package:keep_notes/firebase_layer/addNote.dart';

class Newpage extends StatefulWidget {
  const Newpage({Key? key}) : super(key: key);

  @override
  _NewpageState createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  String title = '', note = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                child: isLoading
                    ? CircularProgressIndicator()
                    : FaIcon(
                        FontAwesomeIcons.check,
                        size: 35,
                        color: AppColorScheme.yellow,
                      ),
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await addNote(title, note);

                  Navigator.pop(context, true);
                },
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyTextField(
                hintString: 'Title',
                maxline: null,
                type: NoteInputType.Title,
                onchange: (val) {
                  title = val;
                },
              ),
              MyTextField(
                hintString: 'Note',
                maxline: null,
                onchange: (val) {
                  note = val;
                },
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_notes/constants/colorScheme.dart';
import 'package:keep_notes/firebase_layer/deleteNote.dart';

class DeleteDialog extends StatefulWidget {
  const DeleteDialog({Key? key}) : super(key: key);

  @override
  _DeleteDialogState createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    int idx = 1;
    bool isLoading = false;

    return AlertDialog(
      backgroundColor: AppColorScheme.yellow,
      title: Text(
        'Enter the index of the note you want to delete?',
        style: TextStyle(color: Colors.white),
      ),
      content: TextField(
        keyboardType: TextInputType.number,
        onChanged: (val) {
          idx = int.parse(val);
        },
      ),
      actions: [
        isLoading
            // ignore: dead_code
            ? Text('deleting...')
            : GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });

                  await deleteNote(idx);
                  setState(() {
                    isLoading = false;
                  });

                  Navigator.pop(context);
                },
                child: FaIcon(
                  FontAwesomeIcons.trash,
                  size: 40,
                  color: Colors.red,
                ),
              )
      ],
    );
  }
}

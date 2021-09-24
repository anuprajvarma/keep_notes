import 'package:flutter/material.dart';
import 'package:keep_notes/constants/colorScheme.dart';

class NoteCard extends StatelessWidget {
  String title;
  String note;
  int index;

  NoteCard(
      {this.note =
          'My note.kjadfgegfilasfnfvkjasklvbliaslkljdafvbadfi;vjlksfbvjliulfvjhafsbvkjlb',
      this.title = 'Note title',
      this.index = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColorScheme.grey3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$index.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            note,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          )
        ],
      ),
    );
  }
}

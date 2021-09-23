import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_notes/components/enums.dart';
import 'package:keep_notes/constants/colorScheme.dart';

class MyTextField extends StatelessWidget {
  String hintString;
  int? maxline;
  NoteInputType type;
  var onchange;

  MyTextField(
      {this.hintString = '',
      this.maxline = 1,
      this.type = NoteInputType.Note,
      this.onchange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        color: AppColorScheme.dark,
        child: TextField(
          onChanged: onchange,
          cursorHeight: 25,
          maxLines: maxline,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintString,
              hintStyle: TextStyle(
                  color: AppColorScheme.grey1,
                  fontWeight:
                      type == NoteInputType.Title ? FontWeight.bold : null,
                  fontSize: type == NoteInputType.Title ? 25 : 20),
              counterStyle: TextStyle(
                color: Colors.white,
              )),
          style: TextStyle(
            color: Colors.white,
            fontSize: type == NoteInputType.Title ? 25 : 20,
            fontWeight: type == NoteInputType.Title ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}

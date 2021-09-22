import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_notes/constants/colorScheme.dart';

class MyTextField extends StatelessWidget {
  String hintString;

  MyTextField({this.hintString = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColorScheme.grey3,
        ),
        child: TextField(
          cursorHeight: 25,
          maxLines: 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintString,
              hintStyle: TextStyle(
                  color: AppColorScheme.grey1,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
              prefixIcon: Icon(
                FontAwesomeIcons.search,
                color: AppColorScheme.grey1,
              ),
              counterStyle: TextStyle(
                color: Colors.white,
              )),
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}

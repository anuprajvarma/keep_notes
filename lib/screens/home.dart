import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keep_notes/constants/colorScheme.dart';

import '../components/myTextfield.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List notes = [];

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
                  fontSize: 40.0),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyTextField(
              hintString: 'Search note',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
      ),
    );
  }
}

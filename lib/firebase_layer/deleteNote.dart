import 'package:cloud_firestore/cloud_firestore.dart';

deleteNote(int index) async {
  try {
    var fetchedData = await FirebaseFirestore.instance
        .collection('users')
        .doc('exampleuser')
        .get();
    var mapOfData = fetchedData.data();

    var listOfNotes = mapOfData!['notes'];

    List listOfNewNotes = [];

    //deleting note from list
    for (int i = 0; i < listOfNotes.length; i++) {
      if (i != (index - 1)) {
        listOfNewNotes.add(listOfNotes[i]);
      }
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc('exampleuser')
        .set({'notes': listOfNewNotes});

    print('note added!!');
  } catch (e) {
    print(e);
  }
}

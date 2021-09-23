import 'package:cloud_firestore/cloud_firestore.dart';

addNote(String title, String note) async {
  try {
    var fetchedData = await FirebaseFirestore.instance
        .collection('users')
        .doc('exampleuser')
        .get();
    var mapOfData = fetchedData.data();

    var listOfNotes = mapOfData!['notes'];

    listOfNotes.add({"title": title, "note": note});

    await FirebaseFirestore.instance
        .collection('users')
        .doc('exampleuser')
        .set({'notes': listOfNotes});

    print('note added!!');
  } catch (e) {
    print(e);
  }
}

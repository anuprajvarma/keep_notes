import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getNotes() async {
  var fetchedData = await FirebaseFirestore.instance
      .collection('users')
      .doc('exampleuser')
      .get();

  var mapOfData = fetchedData.data();

  return mapOfData!['notes'];
}

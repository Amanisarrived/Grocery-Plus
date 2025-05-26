import 'package:cloud_firestore/cloud_firestore.dart';

class CatogeriesItems {
  final CollectionReference catogeriesItems = FirebaseFirestore.instance
      .collection("catogeriesItems");

  Future<List<Map<String, dynamic>>> getCatogeries() async {
    QuerySnapshot snapshot = await catogeriesItems.get();

    return snapshot.docs.map((doc) {
      var data = doc.data() as Map<String, dynamic>;
      data["id"] = doc.id;
      return data;
    }).toList();
  }

  Future<List<Map<String, dynamic>>> getItembyCarogery(String catid) async {
    CollectionReference itemref = catogeriesItems
        .doc(catid)
        .collection("items");

    QuerySnapshot snapshot = await itemref.get();

    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}

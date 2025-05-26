import "package:cloud_firestore/cloud_firestore.dart";

class CartService {
 final CollectionReference cartCollection = FirebaseFirestore.instance.collection("cartItems");

 Future<List<Map<String, dynamic>>> getcartItem() async{
  QuerySnapshot snapshot = await cartCollection.get();
  return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
 }
}
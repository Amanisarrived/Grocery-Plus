import 'package:flutter/material.dart';
import 'package:my_project_first/models/catogery_model.dart';
import 'package:my_project_first/models/item_model.dart';
import 'package:my_project_first/firebase/catogeries_items.dart';

class ProductProvider extends ChangeNotifier {
  List<ItemModel> searchdItem = [];
  List<CatogeryModel> catogeryList = [
    CatogeryModel(
      catogeryImage: "lib/assets/images/fruits and veg.png",
      catogeryTitle: "Fruits and Vegetables",
      id: "cat1",
    ),

    CatogeryModel(
      catogeryImage: "lib/assets/images/breakfast.png",
      catogeryTitle: "Breakfast",
      id: "cat2",
    ),

    CatogeryModel(
      catogeryImage: "lib/assets/images/bevrages.png",
      catogeryTitle: "Beverages",
      id: "cat3",
    ),

    CatogeryModel(
      catogeryImage: "lib/assets/images/meat.png",
      catogeryTitle: "Meat and Fish",
      id: "cat4",
    ),

    CatogeryModel(
      catogeryImage: "lib/assets/images/snacks.png",
      catogeryTitle: "Snacks",
      id: "cat5",
    ),

    CatogeryModel(
      catogeryImage: "lib/assets/images/dairy.png",
      catogeryTitle: "Dairy",
      id: "cat6",
    ),
  ];

  ProductProvider();

  // Fetch items from Firebase for a given category
  Future<void> fetchItemsFromFirebase(String catogeryId) async {
    final service = CatogeriesItems();
    final fetched = await service.getItembyCarogery(catogeryId);
    searchdItem = fetched.map((item) => ItemModel(
      id: item['id'] ?? '',
      itemImage: item['image'] ?? '',
      itemName: item['name'] ?? '',
      itemPrice: item['price'] ?? 0,
      quantity: item['quantity'] ?? 1,
      catogeryId: catogeryId,
    )).toList();
    notifyListeners();
  }

  // Searching item function (now only filters current searchdItem)
  void serchingItem(String value) {
    if (value.isEmpty) {
      // Do nothing or optionally re-fetch from Firebase
    } else {
      searchdItem = searchdItem
          .where((e) => e.itemName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void search(String query) {
    if (query.isEmpty) {
      // Do nothing or optionally re-fetch from Firebase
    } else {
      searchdItem = searchdItem.where((item) => item.itemName.contains(query)).toList();
    }
    notifyListeners();
  }
}

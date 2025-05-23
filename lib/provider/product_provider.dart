import 'package:flutter/material.dart';
import 'package:my_project_first/models/catogery_model.dart';
import 'package:my_project_first/models/item_model.dart';

class ProductProvider extends ChangeNotifier {
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

  final List<ItemModel> allItems = [
    ItemModel(
      id: "i1",
      itemImage: "lib/assets/images/Apple.png",
      itemName: "Apple",
      itemPrice: 8,
      quantity: 1,
      catogeryId: "cat1",
    ),

      ItemModel(
      id: "i2",
      itemImage: "lib/assets/images/Mango.png",
      itemName: "Mango",
      itemPrice: 10,
      quantity: 1,
      catogeryId: "cat1",
    ),
  ];
}

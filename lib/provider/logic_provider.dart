import 'package:flutter/material.dart';
import 'package:my_project_first/models/item_model.dart';

class LogicProvider extends ChangeNotifier {
  final List<ItemModel> userSelected = [];

  //adding item to the cart
  void addToCart(ItemModel item, int quantity) {
    final index = userSelected.indexWhere((e) => e.id == item.id);

    if (index != -1) {
      userSelected[index].quantity = quantity;
    } else {
      item.quantity = quantity;
      userSelected.add(item);
    }
    notifyListeners();
  }

  //updating item to the cart
  void updateCart(ItemModel item, int newquantity) {
    final index = userSelected.indexWhere((e) => e.id == item.id);

    if (index != -1) {
      userSelected[index].quantity = newquantity;
    }
    notifyListeners();
  }

  int get totalItems {
    return userSelected.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return userSelected.fold(
      0,
      (sum, item) => sum + (item.quantity * item.itemPrice),
    );
  }

  void removeFromCart(ItemModel item) {
    userSelected.removeWhere((e) => e.id == item.id);
    notifyListeners();
  }
}

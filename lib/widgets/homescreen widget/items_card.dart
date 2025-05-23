import 'package:flutter/material.dart';
import 'package:my_project_first/models/item_model.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({required this.carditem,super.key});
  final ItemModel carditem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(carditem.itemName),
    );
  }
}
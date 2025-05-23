import 'package:flutter/material.dart';
import 'package:my_project_first/models/catogery_model.dart';
import 'package:my_project_first/models/item_model.dart';
import 'package:my_project_first/screens/selected_item.dart';

class CatogeryCard extends StatelessWidget {
  const CatogeryCard({
    required this.itemList,
    required this.catogeries,
    super.key,
  });
  final CatogeryModel catogeries;
  final List<ItemModel> itemList;

  void slectedCatogery(BuildContext context) {
    final filteredItems = itemList
        .where((allElement) => allElement.catogeryId == catogeries.id)
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            SelectedItem(catogeries: catogeries, items: filteredItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        slectedCatogery(context);
      },
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(catogeries.catogeryImage, width: 100, height: 110),
              SizedBox(height: 10),
              Text(catogeries.catogeryTitle),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_project_first/models/catogery_model.dart';
import 'package:my_project_first/models/item_model.dart';
import 'package:my_project_first/screens/item_cart.dart';
import 'package:my_project_first/widgets/homescreen%20widget/Items_tile.dart';

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    required this.items,
    required this.catogeries,
    super.key,
  });

  final CatogeryModel catogeries;
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(catogeries.catogeryTitle)),
        body: items.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("lib/assets/images/Noitems.png"),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Opps! We cant find your product! But you can add it to wishlist",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) =>
                    ItemsTile(allItems: items[index]),
              ),
        bottomNavigationBar: items.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CartSummaryBar()),
                      );
                    },
                    child: Text(
                      "Proceed",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

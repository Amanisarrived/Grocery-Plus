import 'package:flutter/material.dart';
import 'package:my_project_first/firebase/catogeries_items.dart';
import 'package:my_project_first/models/catogery_model.dart';
import 'package:my_project_first/models/item_model.dart';
import 'package:my_project_first/screens/item_cart.dart';
import 'package:my_project_first/widgets/homescreen%20widget/Items_tile.dart';

class SelectedItem extends StatefulWidget {
  const SelectedItem({required this.catogeries, super.key});

  final CatogeryModel catogeries;

  @override
  State<SelectedItem> createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  List<Map<String, dynamic>> items = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    final service = CatogeriesItems();
    print("Fetching for: " + widget.catogeries.id);
    final fetched = await service.getItembyCarogery(widget.catogeries.id);
    print("Fetched: $fetched");
    setState(() {
      items = fetched;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.catogeries.catogeryTitle)),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : items.isEmpty
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
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 70),
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        // Convert firebase map to ItemModel
                        final itemModel = ItemModel(
                          id: item['id'] ?? '',
                          itemImage: item['image'] ?? '',
                          itemName: item['name'] ?? '',
                          itemPrice: item['price'] ?? 0,
                          quantity: item['quantity'] ?? 1,
                          catogeryId: widget.catogeries.id,
                        );
                        return ItemsTile(allItems: itemModel);
                      },
                    ),
                  ),
                  if (items.isNotEmpty)
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 16,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CartSummaryBar(),
                              ),
                            );
                          },
                          icon: Icon(Icons.shopping_cart),
                          label: Text(
                            'Proceed to Cart',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

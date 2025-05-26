import 'package:flutter/material.dart';
import 'package:my_project_first/models/item_model.dart';
import 'package:my_project_first/provider/logic_provider.dart';
import 'package:my_project_first/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ItemsTile extends StatefulWidget {
  const ItemsTile({required this.allItems, super.key});
  final ItemModel allItems;

  @override
  State<ItemsTile> createState() => _ItemsTileState();
}

class _ItemsTileState extends State<ItemsTile> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 376,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: widget.allItems.itemImage.startsWith('http')
                    ? Image.network(
                        widget.allItems.itemImage,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        widget.allItems.itemImage,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.allItems.itemName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "₹${widget.allItems.itemPrice}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: Icon(
                          Icons.add_circle_outline,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(quantity.toString(), style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 0) {
                              quantity--;
                              Provider.of<LogicProvider>(context, listen: false)
                                  .removeFromCart(widget.allItems);
                            }
                      });
                        },
                        icon: Icon(
                          Icons.remove_circle_outline,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Theme.of(context).primaryColor,
                child: IconButton(
                  onPressed: () {
                    quantity == 0
                        ? showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              content: Text("Select Quantity"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Okay"),
                                ),
                              ],
                            ),
                          )
                        : Provider.of<LogicProvider>(
                            context,
                            listen: false,
                          ).addToCart(widget.allItems, quantity);
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

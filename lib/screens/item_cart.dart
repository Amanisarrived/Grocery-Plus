
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_project_first/provider/logic_provider.dart';
import 'package:provider/provider.dart';

class CartSummaryBar extends StatefulWidget {
  const CartSummaryBar({super.key});

  @override
  State<CartSummaryBar> createState() => _CartSummaryBarState();
}

class _CartSummaryBarState extends State<CartSummaryBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Cart Summary")),
        body: Consumer<LogicProvider>(
          builder: (context, cart, _) {
            return Column(
              children: [
                Expanded(
                  child: cart.userSelected.isEmpty
                      ? Center(child: Text("No items in cart"))
                      : ListView.builder(
                          itemCount: cart.userSelected.length,
                          itemBuilder: (context, index) {
                            final item = cart.userSelected[index];
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (_) {
                                      setState(() {
                                        cart.userSelected.removeAt(index);
                                      });
                                    },
                                    backgroundColor: Colors.redAccent,
                                    icon: Icons.delete,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: Image.asset(
                                  item.itemImage,
                                  width: 40,
                                  height: 40,
                                ),
                                title: Text(item.itemName),
                                subtitle: Text(
                                  "₹${item.itemPrice} x ${item.quantity}",
                                ),
                                trailing: Text(
                                  "₹${item.itemPrice * item.quantity}",
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.green[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Items: ${cart.totalItems}"),
                      Text("Total: ₹${cart.totalPrice.toStringAsFixed(2)}"),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

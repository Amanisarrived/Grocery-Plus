import 'package:flutter/material.dart';
import 'package:my_project_first/provider/logic_provider.dart';
import 'package:provider/provider.dart';

class CartSummaryBar extends StatelessWidget {
  const CartSummaryBar({super.key});

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
                            return ListTile(
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

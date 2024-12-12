import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/cart_state.dart';

class OrderHistoryScreen extends StatelessWidget {
  static const routeName = '/order-history-screen';
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<CartState>(context).orders;
    if (orders.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Order History'),
        ),
        body: const Center(
          child: Text("No orders yet!"),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Order History'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Order ID: ${orders[index].id}"),
                        Text("Email: ${orders[index].email}"),
                        Text("Phone: ${orders[index].phone}"),
                        Text("Address: ${orders[index].address}"),
                        Text("Created At: ${orders[index].createdAt}"),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}

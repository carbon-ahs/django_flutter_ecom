import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../state/cart_state.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context).cartModel;
    String formattedDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.parse(cart.createdAt.toString()));

    if (cart == null) {
      return const Center(
        child: Text("Cart is Empty"),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
              tooltip: cart.cartProducts?.length.toString(),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total Price: ${cart.total}"),
                  Text("Total Quantity: ${cart.cartProducts?.length}"),
                ],
              ),
              Text("Date: $formattedDate"),
              Divider(thickness: 2),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.cartProducts?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cart.cartProducts?[index].product?[0].title ??
                                      "",
                                ),
                                Text(
                                  "Quantity: ${cart.cartProducts?[index].quantity}",
                                ),
                                Text(
                                  "Price: ${cart.cartProducts?[index].price}",
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Divider(thickness: 2),
            ],
          ),
        ),
      );
    }
  }
}

import 'package:ecom_app/util/config/env.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/product_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details-screen';
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final product = Provider.of<ProductState>(context).singleProductById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.network(
              Env.apiBaseUrlOffice + product.image!,
              height: 300,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Market Price: BDT ${product.marketPrice!.toString()}",
                    ),
                    Text(
                      "Selling Price: BDT ${product.sellingPrice!.toString()}",
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () => _addToCart(context, id),
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _addToCart(BuildContext context, int id) {}
}

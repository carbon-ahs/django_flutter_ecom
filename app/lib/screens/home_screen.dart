import 'package:ecom_app/widgets/app_drawer.dart';
import 'package:ecom_app/widgets/single_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/cart_state.dart';
import '../state/product_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _init = true;
  bool _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (_init) {
      Provider.of<CartState>(context).getCartModel();
      _isLoading = await Provider.of<ProductState>(context).getProducts();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductState>(context).products;
    if (!_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: AppDrawer(),
        body: Center(
          child: Text("Something is Wrong Try Again!"),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/cart-screen'),
              icon: const Icon(Icons.shopping_cart),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return SingleProduct(
              id: products[index].id!,
              title: products[index].title!,
              imageUrl: products[index].image!,
              isFavorite: products[index].isFavorite!,
            );
          },
        ),
      );
    }
  }
}

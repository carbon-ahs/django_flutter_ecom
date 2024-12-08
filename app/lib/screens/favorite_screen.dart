import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/product_state.dart';
import '../widgets/app_drawer.dart';
import '../widgets/single_product.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite-screen';
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProducts =
        Provider.of<ProductState>(context).favoriteProducts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: favoriteProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return SingleProduct(
              id: favoriteProducts[index].id!,
              title: favoriteProducts[index].title!,
              imageUrl: favoriteProducts[index].image!,
              isFavorite: favoriteProducts[index].isFavorite!,
            );
          },
        ),
      ),
    );
  }
}

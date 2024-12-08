import 'package:ecom_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/product_state.dart';
import '../util/config/env.dart';

class SingleProduct extends StatelessWidget {
  final int id;
  final String title;
  final String imageUrl;
  final bool isFavorite;

  const SingleProduct({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(title),
        leading: IconButton(
          onPressed: () => _onFavoritePressed(context, id),
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        ),
      ),
      // child: Image.network("$imageUrl"),
      child: GestureDetector(
        onTap: () => _onTilePressed(context, id),
        child: Image.network(
          Env.apiBaseUrlOffice + imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void _onFavoritePressed(BuildContext context, int id) {
    Provider.of<ProductState>(context, listen: false).favoriteToggleHandler(id);
  }

  void _onTilePressed(BuildContext context, int productId) {
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: productId,
    );
  }
}

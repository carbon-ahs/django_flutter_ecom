import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';
import '../service_locator.dart';
import '../util/config/env.dart';

class ProductState with ChangeNotifier {
  SharedPreferences prefs = sl<SharedPreferences>();

  List<Product> _products = [];

  Future<bool> getProducts() async {
    // String url = 'http://localhost:8000/api/products';
    // String url = 'http://10.10.2.203:5800/api/products';
    // String url = 'http://192.168.58.2:8000/api/products';
    String url = '${Env.apiBaseUrlOffice}/api/products';
    var token = prefs.getString('token');
    try {
      print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'token $token',
        },
      );

      var data = json.decode(response.body) as List;
      print(data);
      List<Product> temp = [];

      for (var element in data) {
        Product product = Product.fromJson(element);
        temp.add(product);
      }

      _products = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  List<Product> get products {
    return [..._products];
  }

  List<Product> get favoriteProducts {
    return _products.where((product) => product.isFavorite == true).toList();
  }

  Product singleProductById(int id) {
    return _products.firstWhere((product) => product.id == id);
  }

  Future<void> favoriteToggleHandler(int id) async {
    // String url = 'http://localhost:8000/api/products';
    // String url = 'http://10.10.2.203:5800/api/products';
    // String url = 'http://192.168.58.2:8000/api/products';
    String url = '${Env.apiBaseUrlOffice}/api/favorite/';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token bd05e22f6536f18338ac7205f9010d2688af901b',
        },
        body: jsonEncode(
          {
            'id': id,
          },
        ),
      );

      var data = json.decode(response.body);
      getProducts();
      print(data);
    } catch (e) {
      print("Error from fav toggler: $e");
    }
  }
}

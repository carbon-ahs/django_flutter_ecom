import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductState with ChangeNotifier {
  List<Product> _products = [];

  Future<bool> getProducts() async {
    // String url = 'http://localhost:8000/api/products';
    // String url = 'http://10.10.2.203:5800/api/products';
    String url = 'http://192.168.58.2:8000/api/products';

    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}

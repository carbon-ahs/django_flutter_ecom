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
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'token bd05e22f6536f18338ac7205f9010d2688af901b'
      });
      print(response.body);
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}

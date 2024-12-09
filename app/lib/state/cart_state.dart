import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';
import '../service_locator.dart';
import '../util/config/env.dart';

class CartState with ChangeNotifier {
  SharedPreferences prefs = sl<SharedPreferences>();
  late CartModel _cartModel;
  Future<void> getCartModel() async {
    var token = prefs.getString('token');
    String url = '${Env.apiBaseUrlOffice}/api/cart';

    try {
      print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'token $token',
        },
      );

      var data = json.decode(response.body) as Map;
      print(response);
      // print(data["data"]);
      List<CartModel> temp = [];

      if (data["data"] != null) {
        data["data"].forEach((element) {
          CartModel cart = CartModel.fromJson(element);
          temp.add(cart);
        });
      }
      _cartModel = temp[0];
      notifyListeners();
    } catch (e) {
      print("Error getCart: $e");
    }
  }

  CartModel get cartModel {
    return _cartModel;
  }
}

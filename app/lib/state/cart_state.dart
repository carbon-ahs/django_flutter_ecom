import 'dart:convert';

import 'package:ecom_app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';
import '../service_locator.dart';
import '../util/config/env.dart';

class CartState with ChangeNotifier {
  SharedPreferences prefs = sl<SharedPreferences>();
  late CartModel _cartModel;
  List<Order> _orders = [];
  Future<void> getCartModel() async {
    var token = prefs.getString('token');
    String url = '${Env.apiBaseUrl}/api/cart';

    try {
      print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'token $token',
        },
      );

      var data = json.decode(response.body) as Map;
      // print(response);
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

  Future<void> getOrders() async {
    var token = prefs.getString('token');
    String url = '${Env.apiBaseUrl}/api/order';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'token $token',
        },
      );

      var data = json.decode(response.body) as Map;
      print(response);
      // print(data["data"]);

      if (data["error"] == false) {
        data["data"].forEach((element) {
          Order order = Order.fromJson(element);
          _orders.add(order);
        });
      } else {
        print("Error getOrders: ${data["error"]}");
      }
      notifyListeners();
    } catch (e) {
      print("Error getOrders: $e");
    }
  }

  CartModel get cartModel {
    return _cartModel;
  }

  List<Order> get orders {
    if (_orders.isNotEmpty) {
      return [..._orders];
    }
    return _orders;
  }
}

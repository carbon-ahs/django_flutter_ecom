import 'dart:convert';

import 'package:ecom_app/service_locator.dart';
import 'package:ecom_app/util/config/env.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserState with ChangeNotifier {
  // LocalStorage storage = new LocalStorage('user');
  // final Future<SharedPreferencesWithCache> _prefs =
  //     SharedPreferencesWithCache.create(
  //   cacheOptions: const SharedPreferencesWithCacheOptions(
  //     allowList: <String>{'user'},
  //   ),
  // );
  SharedPreferences prefs = sl<SharedPreferences>();

  // UserState() {
  //   _init();
  // }

  // Future<void> _init() async {
  //   prefs = await SharedPreferences.getInstance();
  //   notifyListeners();
  // }

  Future<bool> loginNow(String userName, String password) async {
    String url = '${Env.apiBaseUrlOffice}/api/login/';

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(
          {"username": userName, "password": password},
        ),
      );
      var data = json.decode(response.body) as Map;
      print(data);
      if (data.containsKey("token")) {
        // storage.setItem("token", data['token']);
        await prefs.setString('token', data['token']);
        print(prefs.getString('token'));
        return true;
      }

      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }
}

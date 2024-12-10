import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service_locator.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('Hello Friend!'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.shop),
          title: const Text('Shop'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/home-screen');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.payment),
          title: const Text('Old Orders'),
          onTap: () {
            Navigator.of(context).pushNamed('/order-history-screen');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Favorite'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed('/favorite-screen');
          },
        ),
        Spacer(),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            _logoutNow(context);
          },
        ),
      ]),
    );
  }

  void _logoutNow(BuildContext context) {
    SharedPreferences prefs = sl<SharedPreferences>();
    prefs.remove('token');
    Navigator.of(context).pushReplacementNamed('/login-screen');
  }
}

import 'package:flutter/material.dart';

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
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.payment),
          title: const Text('Orders'),
          onTap: () {
            // Navigator.of(context).pushReplacementNamed('/orders');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Favorite'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/favorite-screen');
          },
        ),
      ]),
    );
  }
}

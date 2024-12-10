import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  static const routeName = '/order-history-screen';
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: const Center(
        child: Text(
          'Order History Screen',
        ),
      ),
    );
  }
}

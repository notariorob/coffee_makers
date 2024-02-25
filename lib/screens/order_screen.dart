import 'package:coffee_makers/data_manager.dart';
import 'package:coffee_makers/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.dataManager});

  final DataManager dataManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = dataManager.cart[index];
            return OrderItem(item: item);
          },
          itemCount: dataManager.cart.length),
    );
  }
}

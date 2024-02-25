import 'package:coffee_makers/models/cart_item.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Image.network(item.product.imageUrl),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.product.name),
                  Text('\$${item.product.price.toStringAsFixed(2)}'),
                ],
              ),
              Text(item.quantity.toString()),
            ],
          ),
        ),
      ],
    ));
  }
}

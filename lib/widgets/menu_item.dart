import 'package:coffee_makers/models/product.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.product, required this.onAdd});

  final Product product;
  final Function onAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Image.network(product.imageUrl),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                ],
              ),
              ElevatedButton(
                onPressed: () => onAdd(product),
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

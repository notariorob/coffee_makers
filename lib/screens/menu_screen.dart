import 'package:coffee_makers/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          MenuItem(
            title: 'Pizza',
            subtitle: 'Tasty pizza',
          ),
          MenuItem(
            title: 'Pasta',
            subtitle: 'Delicious pasta',
          ),
          MenuItem(
            title: 'Salad',
            subtitle: 'Healthy salad',
          ),
          MenuItem(
            title: 'Burger',
            subtitle: 'Yummy burger',
          ),
          MenuItem(
            title: 'Sandwich',
            subtitle: 'Tasty sandwich',
          ),
        ],
      ),
    );
  }
}

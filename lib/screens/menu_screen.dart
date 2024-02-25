import 'package:coffee_makers/data_manager.dart';
import 'package:coffee_makers/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.dataManager});

  final DataManager dataManager;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: FutureBuilder(
        future: dataManager.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return MenuItem(
                product: snapshot.data![index],
                onAdd: dataManager.addToCart,
              );
            },
          );
        },
      ),
    );
  }
}

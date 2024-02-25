import 'package:coffee_makers/models/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  CartItem.fromJson(Map<String, dynamic> json)
      : product = Product.fromJson(json['product']),
        quantity = json['quantity'];
}

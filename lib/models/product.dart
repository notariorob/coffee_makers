class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;

  String get imageUrl =>
      'https://firtman.github.io/coffeemasters/api/images/$image';

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'].toDouble(),
        image = json['image'],
        category = json['category'];
}

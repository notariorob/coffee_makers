class Product {
  final String name;
  final double price;
  final String image;
  final List<String> categories;

  String get imageUrl => 'https://blablabla/$image';

  Product(
      {required this.name,
      required this.price,
      required this.image,
      List<String>? categories})
      : categories = categories ?? [];
}

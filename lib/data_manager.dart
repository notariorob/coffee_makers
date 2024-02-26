import 'package:coffee_makers/models/cart_item.dart';
import 'package:coffee_makers/models/product.dart';

List<dynamic> mockJsonResponse = [
  {
    "id": 11,
    "name": "Black Americano",
    "price": 1.50,
    "description": "Freshly pulled shots of espresso combined with hot water.",
    "category": "HOT COFFEE",
    "image": "blackamericano.png"
  },
  {
    "id": 12,
    "name": "Cappuccino",
    "price": 3.75,
    "description":
        "A freshly pulled shot of espresso layered with steamed whole milk and thick rich foam to offer a luxurious velvety texture and complex aroma.",
    "category": "HOT COFFEE",
    "image": "cappuccino.png"
  },
  {
    "id": 13,
    "name": "Macchiato",
    "price": 3.25,
    "description":
        "Our perfectly roasted coffees are blended with our powders, steamed non-fat milk and topped with thick foam to create a delicious pick-me-up treat.",
    "category": "HOT COFFEE",
    "image": "macchiato.png"
  },
  {
    "id": 14,
    "name": "Flat White",
    "price": 3.25,
    "description":
        "We start with an extra shot of espresso, combine them with one of our signature powders, and finished with lightly aerated milk to create the perfect, velvety espresso beverage. Available in hazelnut, vanilla, mocha or classic flat white.",
    "category": "HOT COFFEE",
    "image": "flatwhite.png"
  },
  {
    "id": 21,
    "name": "Frappuccino",
    "price": 3.75,
    "description":
        "Non-fat milk blended with our signature powders and ice and then topped with whipped cream. A delicious non-caffeinated treat.",
    "category": "ICED COFFEE",
    "image": "frappuccino.png"
  },
  {
    "id": 22,
    "name": "Iced Coffee",
    "price": 3.15,
    "description":
        "Our specially brewed coffee served over ice for a refreshing and bold coffee taste",
    "category": "ICED COFFEE",
    "image": "icedcoffee.png"
  },
  {
    "id": 23,
    "name": "Cold Brew",
    "price": 1.85,
    "description":
        "Our signature Cold Brew Coffee is a premium blend of Bali Blue Moon and Ethiopia Yirgacheffe coffees with chicory steeped cold for 20 hours for rich, vibrant flavors.",
    "category": "ICED COFFEE",
    "image": "coldbrew.png"
  },
  {
    "id": 31,
    "name": "Green Tea",
    "price": 1.75,
    "description":
        "Like oolong and black tea, green tea comes from the plant Camellia sinensis. Green tea's delightfully delicate flavor is due to its minimal oxidation. It is processed to take a variety of forms, from finely ground powder to long, curling leaves. Though it originated in China, where it has been consumed for over 4,000 years, green tea is now grown in Japan and Sri Lanka, and enjoyed throughout the world.",
    "category": "TEA",
    "image": "greentea.png"
  },
  {
    "id": 32,
    "name": "Black Tea",
    "price": 1.75,
    "description":
        "Like green and oolong teas, black tea comes from the Camellia sinensis plant. Its darker hue and stronger taste result from the greater level of oxidation it undergoes during processing. From delicate Darjeeling to strong Ceylon, each variety has distinct characteristics, making black tea a beloved beverage across the globe.",
    "category": "TEA",
    "image": "blacktea.png"
  },
  {
    "id": 41,
    "name": "Croissant",
    "price": 2.80,
    "description": "Buttery, crescent-shaped French pastry",
    "category": "SNACKS",
    "image": "croissant.png"
  },
  {
    "id": 42,
    "name": "Chocolate Chip Muffin",
    "price": 1.75,
    "description":
        "The muffins are incredibly rich, mega chocolate-y, and loaded with chocolate chips in every single bite",
    "category": "SNACKS",
    "image": "muffin.png"
  }
];

class DataManager {
  List<Product>? _products;
  final List<CartItem> _cart = [];
  static final DataManager _instance = DataManager._internal();

  DataManager._internal();

  factory DataManager() {
    return _instance;
  }

  List<CartItem> get cart => _cart;

  void removeFromCart(Product product) {
    _cart.removeWhere((element) => element.product == product);
  }

  void removeOneFromCart(Product product) {
    final cartItem = _cart.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (cartItem.quantity == 1) {
      _cart.remove(cartItem);
    }

    cartItem.quantity--;
  }

  void addToCart(Product product) {
    final cartItem = _cart.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (cartItem.quantity == 0) {
      _cart.add(cartItem);
    }

    cartItem.quantity++;
  }

  void clearCart() {
    _cart.clear();
  }

  Future<void> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Product> prods =
        mockJsonResponse.map((e) => Product.fromJson(e)).toList();

    if (_products != null) {
      _products!.clear();
      _products!.addAll(prods);
    } else {
      _products = prods;
    }
  }

  Future<List<Product>> getProducts() async {
    if (_products == null) {
      await fetchProducts();
    }

    return _products!;
  }
}

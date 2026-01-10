class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;

  final int stock;
  final double? discountPercent;
  final int maxQuantity;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    this.stock = 20,
    this.discountPercent,
    this.maxQuantity = 10,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      category: json['category'],
    );
  }

  double get discountedPrice {
    if (discountPercent != null) {
      return price * (1 - discountPercent! / 100);
    }
    return price;
  }

  bool get isInStock => stock > 0;
}
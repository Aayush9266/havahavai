// models/product_model.dart
class Product {
  final int id;
  final String title;
  final String thumbnail;
  final double price;
  final double discountPercentage;
  final String category;
  final int stock;

  Product({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.discountPercentage,
    required this.category,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price']?.toDouble() ?? 0.0,
      discountPercentage: json['discountPercentage']?.toDouble() ?? 0.0,
      category: json['category'],
      stock: json['stock'],
    );
  }

  double get discountedPrice => price * (1 - discountPercentage / 100);
}

class ProductResponse {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      products: (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
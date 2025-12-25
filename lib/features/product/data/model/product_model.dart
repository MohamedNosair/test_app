import 'package:test_app/features/product/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.stars,
    required super.location,
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      stars: json['stars'],
      location: json['location'],
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price']),
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'location': location,
      'stars': stars,
    };
  }
}

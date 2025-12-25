import 'package:test_app/features/product/model/product_model.dart';

class AllProductModel {
  final int totalSize;
  final List<Product> products;

  AllProductModel({required this.totalSize, required this.products});
  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
      totalSize: json['total_size'],
      products: (json['products'] as List).map((e) => Product.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_size': totalSize,
      'products': products.map((e) => e.toJson()).toList(),
    };
  }
}
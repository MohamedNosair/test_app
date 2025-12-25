import 'package:test_app/features/product/domain/entity/all_product_entity.dart';
import 'package:test_app/features/product/data/model/product_model.dart';

class AllProductModel extends AllProductEntity {
  AllProductModel({required super.totalSize, required super.productsEntity});

  factory AllProductModel.fromJson(Map<String, dynamic> json) {


    return AllProductModel(
      totalSize: json['total_size'],
      productsEntity: (json['products'] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_size': totalSize,
      'products': productsEntity.map((e) => (e as ProductModel).toJson()).toList(),
    };
  }
}

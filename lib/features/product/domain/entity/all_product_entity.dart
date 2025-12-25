import 'package:test_app/features/product/domain/entity/product_entity.dart';

abstract class AllProductEntity {
  final int totalSize;
  final List<ProductEntity> productsEntity;

  AllProductEntity({required this.totalSize, required this.productsEntity});
}

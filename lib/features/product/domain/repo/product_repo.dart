import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/features/product/data/model/all_product_model.dart';

abstract class ProductRepo {
  Future<Either<Failure, AllProductModel>> getProducts();
}

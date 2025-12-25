import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/features/product/data/model/all_product_model.dart';
import 'package:test_app/features/product/domain/repo/product_repo.dart';

class GetProductUseCase {
final ProductRepo repo;

  GetProductUseCase({required this.repo});

  Future<Either<Failure, AllProductModel>> call() {
    return repo.getProducts() ;
  }
}
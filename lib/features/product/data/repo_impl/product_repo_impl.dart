import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/error_handler.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/core/network/end_point.dart';
import 'package:test_app/core/network/remote/dio_helper.dart';
import 'package:test_app/features/product/data/model/all_product_model.dart';
import 'package:test_app/features/product/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, AllProductModel>> getProducts() async {
    try {
      final response = await DioHelper.getData(url: EndPoint.product);
      final allProduct = AllProductModel.fromJson(response.data);
      return Right(allProduct);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return Left(failure);
    }
  }
}
